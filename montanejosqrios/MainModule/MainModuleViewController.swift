//
//  MainModuleViewController.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//


import UIKit

class MainModuleViewController: UIViewController {
    
    var mainView: MainModuleView?
    var mainRouter: MainModuleRouter?
    
    var selectedName: String?
    var selectedEventName: String?
    var selectedUUID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view = mainView
        
        setupView()
        
    }
    
    private func setupView() {
        guard let mainView = mainView else { return }
        
        //mainView.nombreTerminalLabel.text = "terminal: "
        
        if (Storage.shared.storageGetTestMode()){
            
            mainView.registeredLabel.text = NSLocalizedString("Test Mode Event", comment: "")
            mainView.nombreTerminalLabel.text = "terminal: TEST"
            
        }else{
            
            mainView.registeredLabel.text = NSLocalizedString(Storage.shared.storageGetEventEventName(), comment: "")
            mainView.nombreTerminalLabel.text = NSLocalizedString("terminal: " + Storage.shared.storageGetEventName(), comment: "")
        }
        
        //make back button clickable...
        let backViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(Backbutton(gesture:)))
        // add it to the image view;
        mainView.backImage.addGestureRecognizer(backViewGesture)
        mainView.backImage.isUserInteractionEnabled = true
        
        //make enter QR button clickable...
        let enterQRViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(EnterQRButton(gesture:)))
        // add it to the image view;
        mainView.enterImage.addGestureRecognizer(enterQRViewGesture)
        mainView.enterImage.isUserInteractionEnabled = true
        
        //make enter QR button clickable...
        let exitQRViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(ExitQRButton(gesture:)))
        // add it to the image view;
        mainView.exitImage.addGestureRecognizer(exitQRViewGesture)
        mainView.exitImage.isUserInteractionEnabled = true
        
        //make enter settings button clickable...
        let settingsImageViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(SettingsButton(gesture:)))
        // add it to the image view;
        mainView.settingsImage.addGestureRecognizer(settingsImageViewGesture)
        mainView.settingsImage.isUserInteractionEnabled = true
        
        mainView.versionLabel.text = "v.23-46-01"
        mainView.statusLabel.text = "Datos del evento    >"
        
        //make statusLabel cardview clickable...
        let statusDataGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(StatusData(gesture:)))
        // add it to the image view;
        mainView.cardView1.addGestureRecognizer(statusDataGesture)
        mainView.cardView1.isUserInteractionEnabled = true
        
        if (Storage.shared.storageGetTestMode() == true || Storage.shared.storageDeviceGetRegistered() == true){
            mainView.backImage.isHidden = true
        }
        
    }
    
    @objc func Backbutton(gesture: UIGestureRecognizer) {
    
        Storage.shared.storageSaveTestMode(testMode: false)
        mainRouter?.routeBackToMainView(navigationController: navigationController!)
    }
    
    @objc func StatusData(gesture: UIGestureRecognizer) {
     
        mainRouter?.routeToEventDataStatus(navigationController: navigationController!)
    }
    
    @objc func SettingsButton(gesture: UIGestureRecognizer) {
      
        mainRouter?.routeToSettingsView(navigationController: navigationController!)
    }
    
    @objc func EnterQRButton(gesture: UIGestureRecognizer) {
    
        Storage.shared.storageSaveQRButtonEvent(qrEvent: "enter")
        mainRouter?.routeToQRView(navigationController: navigationController!)
    }
    
    @objc func ExitQRButton(gesture: UIGestureRecognizer) {
  
        Storage.shared.storageSaveQRButtonEvent(qrEvent: "exit")
        mainRouter?.routeToQRView(navigationController: navigationController!)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
}

