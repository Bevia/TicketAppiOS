//
//  ViewController.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 16/8/23.
//

import UIKit
import CoreData

class RegisterDeviceViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, IRegisterEvent {
    
    var mainView: RegisterDeviceView?
    var mainRouter: RegisterDeviceRouter?
    
    let appDelegate = DataBaseHooks.shared.appDelegate
    let context = DataBaseHooks.shared.context
    
    var events = [EventUUID]()
    
    var items: [Item] = []
    var tableView: UITableView!
    var didSelectItem: ((String, String, String) -> Void)?
    
    var selectTableCell: String = "device"  //the other would be event.
    
    let registerDevicePresenter = RegisterEventPresenter()
    
    var textFieldBottomConstraint: NSLayoutConstraint?
    
    let delayInSeconds: Double = 2.0
    // Create a property for the blur effect view
    var blurEffectView: UIVisualEffectView?
    
    private let defaultTextFieldBottomConstant: CGFloat = -240
    private let duration: TimeInterval = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextFields()
        
        //Core date db:
        //let newValue = "6b6d2c29-c54e-3186-8c0e-ad57ef275012" // Replace with your actual value
        //let newValue = "6b6d2c29-c54e-3186-9875-ad57ef275012"
        // Check if the value already exists in the database
        
        /*
         if !isValueDuplicate(value: newValue, inContext: context) {
         // If the value is not a duplicate, create a new managed object and save it
         let entity = NSEntityDescription.entity(forEntityName: "EventUUID", in: context)!
         let newObject = NSManagedObject(entity: entity, insertInto: context)
         newObject.setValue(newValue, forKey: "eventuuid")
         
         // Save the context
         do {
         try context.save()
         print("Value saved successfully.")
         } catch {
         print("Error saving data: \(error.localizedDescription)")
         }
         } else {
         // Value is a duplicate, handle accordingly
         print("Value already exists in the database.")
         }
         */
        
    }
    
    private func setupView() {
        guard let mainView = mainView else { return }
        
        self.view = mainView
        
        //make back button clickable...
        let backViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(Backbutton(gesture:)))
        // add it to the image view;
        mainView.backImage.addGestureRecognizer(backViewGesture)
        mainView.backImage.isUserInteractionEnabled = true
        mainView.backImage.isHidden = true
        
        mainView.tableView.isHidden = true
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(EventsTableViewCell.self, forCellReuseIdentifier: "EventsCell")
        mainView.tableView.register(DeviceTableViewCell.self, forCellReuseIdentifier: "DeviceCell")
        
        mainView.selectAnEventLabel.text = NSLocalizedString("Selectiona un evento", comment: "")
        mainView.selectEventButton.setTitle("Eventos", for: .normal)
        mainView.selectEventButton.addTarget(self, action: #selector(selectEvent), for: .touchUpInside)
        
        mainView.registerButton.addTarget(self, action: #selector(getDevicesFromEvent), for: .touchUpInside)
        mainView.registerButton.setTitle("Registrar", for: .normal)
        mainView.registeredLabel.text = NSLocalizedString("Eventos", comment: "")
        mainView.messageLabel.text = NSLocalizedString("Para registrar el dispositivo, introduce \nel UUID que le ha asignado a tu dispositivo.", comment: "")
        
        //make back button clickable...
        // Add a UILongPressGestureRecognizer
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(imageLongPressed))
        mainView.montanejosImage.addGestureRecognizer(longPressGestureRecognizer)
        
        if((Storage.shared.storageDeviceGetRegistered() == true) || (Storage.shared.storageGetTestMode() == true)){
            
            self.mainRouter?.routeToMainView(navigationController: navigationController!)
            
        }
        
    }
    
    @objc func imageLongPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            // This method will be called when the long press begins
            print("print Montanejos pressed")
            
            Storage.shared.storageSaveTestMode(testMode: true)
            self.mainRouter?.routeToMainView(navigationController: navigationController!)
        }
    }
    
    
    private func setupTextFields() {
        guard let mainView = mainView else { return }
        
        mainView.registrationEditText.delegate = self
        let placeholderText = NSLocalizedString("Teclea o copia UUID aquí", comment: "")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: ButtonsBackgroundTintColor.registro_dispositivo_hint.getColor, // Change this color to your desired color
        ]
        mainView.registrationEditText.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        mainView.registrationEditText.placeholder = placeholderText
        mainView.registrationEditText.textColor = Colors.darkBlue.getColor
        mainView.registrationEditText.inputAssistantItem.leadingBarButtonGroups = []
        mainView.registrationEditText.inputAssistantItem.trailingBarButtonGroups = []
        
        textFieldBottomConstraint = NSLayoutConstraint(item: mainView.registrationEditText, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: defaultTextFieldBottomConstant)
        
        self.view.addConstraint(textFieldBottomConstraint!)
        
    }
    
    private func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @objc func selectEvent(){
        
        selectTableCell = "event"
        
        let request = EventUUID.fetchRequest()
        
        do {
            
            events = try context.fetch(request)
            
            if(events.isEmpty){
                let toast = ToastView(message: "no hay eventos")
                toast.show(in: self.mainView!)
                return
                
            }else{
                
                for data in events as [NSManagedObject]{
                    print("deviceuuid value...")
                    print (data.value(forKey: "eventuuid") as! String)
                }
                
                DispatchQueue.main.async {
                    self.mainView?.tableView.reloadData()
                    
                    DispatchQueue.main.async {
                        self.mainView?.registerButton.isHidden = true
                        self.mainView?.selectEventButton.isHidden = true
                        self.mainView?.messageLabel.isHidden = true
                        self.mainView?.registrationEditText.isHidden = false
                        self.mainView?.tableView.isHidden = false
                        self.mainView?.backImage.isHidden = false
                    }
                }
            }
            
        }
        catch {
            print("Failed to load all your tasks!")
        }
    }
    
    
    //interact with API here....
    @objc func getDevicesFromEvent(){
        
        selectTableCell = "device"
        
        self.mainView?.registrationEditText.text = "6b6d2c29-c54e-3186-8c0e-ad57ef275012"
        
        if let text = self.mainView?.registrationEditText.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty {
            //let toast = ToastView(message: "Mandando registro...")
            //toast.show(in: self.mainView!)
            
            //we get this via email and is to get list of events uuid's
            Storage.shared.storageSaveEventUUID(eventUUID: "6b6d2c29-c54e-3186-8c0e-ad57ef275012")
            
            //save to db:
            self.saveEventToDB(newValue: "6b6d2c29-c54e-3186-8c0e-ad57ef275012")
            
            // Show the loading view with a blurred background
            showLoadingView()
            //registerDevicePresenter.setRegisterEventPresenter(delegate: self, uuid: "6b6d2c29-c54e-3186-8c0e-ad57ef275012")
            
            /*
             testing mocking call to backdn:
             */
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) {
                self.registerDevicePresenter.mockAPICall(delegate: self)
            }
        } else {
            let toast = ToastView(message: "el UUID no puede estar vacio.")
            toast.show(in: self.mainView!)
        }
    }
    
    
    func showLoadingView() {
        // Create a blur effect
        let blurEffect = UIBlurEffect(style: .light)
        
        // Create a blur effect view with the specified effect
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = view.bounds
        blurEffectView?.alpha = 0.6
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Add the blur effect view to the background
        view.addSubview(blurEffectView!)
        
        // Create and show your loading view
        //var loadingView = LoadingView() // Replace with your own loading view implementation
        //loadingView = LoadingView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.addSubview(self.mainView!.indicatorView)
        self.mainView?.indicatorView.startAnimating()
    }
    
    func hideLoadingView() {
        // Remove the blur effect view and loading view
        self.blurEffectView?.removeFromSuperview()
        self.mainView?.indicatorView.stopAnimating()
        // Remove your loading view as well
        // ...
    }
    
    private func saveEventToDB(newValue: String){
        if !isValueDuplicate(value: newValue, inContext: context) {
            // If the value is not a duplicate, create a new managed object and save it
            let entity = NSEntityDescription.entity(forEntityName: "EventUUID", in: context)!
            let newObject = NSManagedObject(entity: entity, insertInto: context)
            newObject.setValue(newValue, forKey: "eventuuid")
            
            // Save the context
            do {
                try context.save()
                print("Value saved successfully.")
            } catch {
                print("Error saving data: \(error.localizedDescription)")
            }
        } else {
            // Value is a duplicate, handle accordingly
            print("Value already exists in the database.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            // Update constraints for the text field to move it up.
            // For example, adjust the bottom constraint:
            textFieldBottomConstraint?.constant = -keyboardHeight
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        // Reset the constraints for the text field to their original values.
        // For example, reset the bottom constraint:
        textFieldBottomConstraint?.constant = defaultTextFieldBottomConstant
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func showError(showLoginError: String?) {
        DispatchQueue.main.async {
            let toast = ToastView(message: "Network error! Try again.")
            toast.show(in: self.mainView!)
        }
    }
    
    struct Item: Decodable {
        let uuid: String
        let name: String
        let phone: String?  // Assuming phone can be a String or nil
        let location: String?  // Assuming location can be a String or nil
        let eventName: String
    }
    
    struct ItemsContainer: Decodable {
        let items: [Item]
    }
    
    
    func deviceUUIDs(data: Data?) {
        
        print("deviceUUIDs data")
        
        hideLoadingView()
        
        do {
            let itemsResponse = try JSONDecoder().decode(ItemsContainer.self, from: data!)
            
            items = itemsResponse.items
            DispatchQueue.main.async {
                
                Storage.shared.storageSaveTestMode(testMode: false)
                self.mainView?.tableView.reloadData()
            }
            
            // Access the parsed data
            for item in itemsResponse.items {
                print("Event Name: \(item.eventName)")
                print("Location: \(item.location ?? "N/A")")
                print("Name: \(item.name)")
                print("Phone: \(item.phone ?? "N/A")")
                print("UUID: \(item.uuid)")
                print("\n")
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
        DispatchQueue.main.async {
            self.mainView?.registerButton.isHidden = true
            self.mainView?.selectEventButton.isHidden = true
            self.mainView?.messageLabel.isHidden = true
            self.mainView?.registrationEditText.isHidden = true
            self.mainView?.tableView.isHidden = false
            self.mainView?.backImage.isHidden = false
        }
        
    }
    
    // Function to check if the value already exists in the database
    func isValueDuplicate(value: String, inContext context: NSManagedObjectContext) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EventUUID")
        let predicate = NSPredicate(format: "eventuuid == %@", value)
        fetchRequest.predicate = predicate
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.count > 0
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            return false
        }
    }
    
    @objc func Backbutton(gesture: UIGestureRecognizer) {
        self.mainView?.registerButton.isHidden = false
        self.mainView?.selectEventButton.isHidden = false
        self.mainView?.messageLabel.isHidden = false
        self.mainView?.registrationEditText.isHidden = false
        self.mainView?.tableView.isHidden = true
        self.mainView?.backImage.isHidden = true
        
    }
}
