//
//  QRReaderViewController.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 26/10/23.
//

import UIKit
import AVFoundation
import CoreData

class QRReaderViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, IDatosQR{
    
    var mainView: QRReaderView?
    var mainRouter: QRReaderViewRouter?
    var captureSession = AVCaptureSession()
    var qrCodeRead = false
    
    let currentDate = Date()
    
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    let appDelegate = DataBaseHooks.shared.appDelegate
    let context = DataBaseHooks.shared.context
    var qrhistorydata = [QRHistory]()
    
    let qRReaderPresenter = QRReaderPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view = mainView
        setupView()
        
        // Prepare the feedback generator
        feedbackGenerator.prepare()
        
    }
    
    
    private func setupView() {
        guard let mainView = mainView else { return }
        
        //make back button clickable...
        let lopdViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(Backbutton(gesture:)))
        // add it to the image view;
        mainView.backImage.addGestureRecognizer(lopdViewGesture)
        mainView.backImage.isUserInteractionEnabled = true
        
        // Get the back-facing camera for capturing videos
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Failed to get the camera device")
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            videoInput = try AVCaptureDeviceInput(device: captureDevice)
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
        // Set the input device on the capture session.
        captureSession.addInput(videoInput)
        
        // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)
        
        // Set self as the delegate for metadata output and use the default dispatch queue to execute the callback
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [.qr]
        
        // Initialize the video preview layer and add it as a sublayer to the view's layer.
        mainView.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        mainView.videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        mainView.videoPreviewLayer.frame = CGRect(x:0, y:0, width: 340, height: 340)
        
        //add subviews here.
        mainView.qrParentView.layer.addSublayer(mainView.videoPreviewLayer)
        mainView.qrParentView.addSubview(mainView.qrCodeFrameView)
        
        // Start video capture.
        DispatchQueue.global(qos: .background).async {
            self.captureSession.startRunning()
        }
    }
    
    func datosQR(data: Data?) {
        
        do {
            // Parse JSON data
            if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                
                // Access individual values
                if let uuid = json["uuid"] as? String,
                   let title = json["title"] as? String,
                   let eventUUID = json["event_uuid"] as? String,
                   let concept = json["concept"] as? String,
                   let currentUsages = json["current_usages"] as? Int16,
                   let availableUsages = json["available_usages"] as? Int16,
                   let maxUsages = json["max_usages"] as? Int16,
                   let ignoreQuota = json["ignore_quota"] as? Bool,
                   let allowAdmission = json["allow_admission"] as? Bool,
                   let state = json["state"] as? String {
                    
                    // Print the values
                    print("UUID: \(uuid)")
                    print("Title: \(title)")
                    print("Event UUID: \(eventUUID)")
                    print("Concept: \(concept)")
                    print("Current Usages: \(currentUsages)")
                    print("Available Usages: \(availableUsages)")
                    print("Max Usages: \(maxUsages)")
                    print("Ignore Quota: \(ignoreQuota)")
                    print("Allow Admission: \(allowAdmission)")
                    print("State: \(state)")
                    
                    if(allowAdmission == true){
                        
                        //QR successfull.....
                        DispatchQueue.global().async {
                            let systemSoundID: SystemSoundID = 1013
                            AudioServicesPlaySystemSound(systemSoundID)
                        }
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss" // Change the format as per your requirement
                        
                        let date = dateFormatter.string(from: currentDate)
                        
                        saveQRDataToDB(
                            date: date,
                            uuid: uuid,
                            title: title,
                            event_uuid: eventUUID,
                            concept: concept,
                            current_usages: currentUsages,
                            available_usages: availableUsages,
                            max_usages: maxUsages,
                            ignore_quota: ignoreQuota,
                            allow_admission: allowAdmission,
                            state: state)
                    }else{
                        
                        DispatchQueue.global().async {
                            
                            //allowAdmission is false.....
                            let toast = ToastView(message: "admissión denegada.")
                            toast.show(in: self.mainView!)
                            
                            //find another sound....
                            let systemSoundID: SystemSoundID = 1013
                            AudioServicesPlaySystemSound(systemSoundID)
                        }
                    }
                }
            }
        }catch {
            print("Error parsing JSON: \(error)")
        }
    }
    
    private func saveQRDataToDB(
        date: String,
        uuid: String,
        title: String,
        event_uuid: String,
        concept: String,
        current_usages: Int16,
        available_usages: Int16,
        max_usages: Int16,
        ignore_quota: Bool,
        allow_admission: Bool,
        state: String){
            
            let entity = NSEntityDescription.entity(forEntityName: "QRHistory", in: context)!
            let newObject = NSManagedObject(entity: entity, insertInto: context)
            
            newObject.setValue(date, forKey: "date")
            newObject.setValue(uuid, forKey: "uuid")
            newObject.setValue(title, forKey: "title")
            newObject.setValue(event_uuid, forKey: "event_uuid")
            newObject.setValue(concept, forKey: "concept")
            newObject.setValue(current_usages, forKey: "current_usages")
            newObject.setValue(available_usages, forKey: "available_usages")
            newObject.setValue(max_usages, forKey: "max_usages")
            newObject.setValue(ignore_quota, forKey: "ignore_quota")
            newObject.setValue(allow_admission, forKey: "allow_admission")
            newObject.setValue(state, forKey: "state")
            
            
            // Save the context
            do {
                try context.save()
                print("Value saved successfully.")
            } catch {
                print("Error saving data: \(error.localizedDescription)")
            }
        }
    
    
    func showError(showError: String?) {
        DispatchQueue.main.async {
            let toast = ToastView(message: "Network error! Try again.")
            toast.show(in: self.mainView!)
        }
    }
    
    @objc func Backbutton(gesture: UIGestureRecognizer) {
        print("print shit")
        mainRouter?.routeBackToMainView(navigationController: navigationController!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
}

