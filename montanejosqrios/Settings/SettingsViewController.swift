//
//  SettingsViewController.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {
    
    var mainView: SettingsView?
    var mainRouter: SettingsRouter?
    
    let appDelegate = DataBaseHooks.shared.appDelegate
    let context = DataBaseHooks.shared.context
    var qrData = [QRHistory]()
    var uuidData = [EventUUID]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view = mainView
        
        setupView()
        
    }
    
    private func setupView() {
        guard let mainView = mainView else { return }
        
        //make back button clickable...
        let backViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(Backbutton(gesture:)))
        // add it to the image view;
        mainView.backImage.addGestureRecognizer(backViewGesture)
        mainView.backImage.isUserInteractionEnabled = true
        
        //mainView.titleLabel.text = "Settings"
        
        mainView.button1.setTitle("Historial", for: .normal)
        mainView.button1.addTarget(self, action: #selector(historial), for: .touchUpInside)
        mainView.text1Label.text = "Historial"
        
        mainView.button2.setTitle("Borrar", for: .normal)
        mainView.button2.addTarget(self, action: #selector(borrarHistorial), for: .touchUpInside)
        mainView.text2Label.text = "Borrar historial"
        
        mainView.button3.setTitle("Resetear", for: .normal)
        mainView.button3.addTarget(self, action: #selector(resetearEvento), for: .touchUpInside)
        mainView.text3Label.text = "Resetear este evento"
        
        mainView.button5.setTitle("Borrar", for: .normal)
        mainView.button5.addTarget(self, action: #selector(borrarUUID), for: .touchUpInside)
        mainView.text5Label.text = "Borrar los eventos"
        
        mainView.button4.setTitle("Listado", for: .normal)
        mainView.button4.addTarget(self, action: #selector(listadoEventos), for: .touchUpInside)
        mainView.text4Label.text = "Listado de eventos"
        
        //mainView.button1.addTarget(self, action: #selector(registerDevice), for: .touchUpInside)
        
        mainView.deviceUUID.text = "device uuid: "
        mainView.deviceUUIDFromStorage.text = Storage.shared.storageGetDeviceUUID()
        mainView.deletingUUIDLabel.text = "Si reseteas el UUID del evento, podrás volver a registrar el dispositivo."
        
    }
    
    @objc func borrarHistorial() {
        
        let request = QRHistory.fetchRequest()
        
        do {
            
            qrData = try context.fetch(request)
            
            if(qrData.isEmpty){
                let toast = ToastView(message: "no hay eventos")
                toast.show(in: self.mainView!)
                return
                
            }else{
                
                //DispatchQueue.main.async {}
                // Create the UIAlertController
                let alertController = UIAlertController(title: "Borrar Historial", message: "Esta acción borrará la base de datos del Historial.", preferredStyle: .alert)
                
                // Add OK action
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                    // Handle OK button tap
                    self.borrarQRHistorial()
                    
                })
                alertController.addAction(okAction)
                
                // Add Cancel action
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                    // Handle Cancel button tap
                    print("Cancel button tapped")
                })
                alertController.addAction(cancelAction)
                
                // Present the alert dialog
                present(alertController, animated: true, completion: nil)
                
            }
            
        }
        catch {
            print("Failed to load all your tasks!")
        }
    }
    
    private func borrarQRHistorial(){
        
        // Assuming "YourEntityName" is the name of your entity
        let fetchRequest: NSFetchRequest<QRHistory> = QRHistory.fetchRequest()
        
        do {
            // Fetch all objects of the entity
            let objects = try context.fetch(fetchRequest)
            
            // Iterate through the objects and delete each one
            for object in objects {
                context.delete(object)
            }
            
            // Save the changes to the persistent store
            try context.save()
            
            let toast = ToastView(message: "¡La base de datos se ha borrado!")
            toast.show(in: self.mainView!)
            
        } catch {
            // Handle the error appropriately
            print("Error deleting data: \(error)")
        }
        
    }
    
    @objc func borrarUUID() {
        
        let request = EventUUID.fetchRequest()
        
        do {
            
            uuidData = try context.fetch(request)
            
            if(uuidData.isEmpty){
                let toast = ToastView(message: "no hay eventos")
                toast.show(in: self.mainView!)
                return
                
            }else{
                
                //DispatchQueue.main.async {}
                // Create the UIAlertController
                let alertController = UIAlertController(title: "Borrar todos lo eventos.", message: "Esta acción borrará la base de datos de los eventos.", preferredStyle: .alert)
                
                // Add OK action
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                    // Handle OK button tap
                    
                    // Assuming "YourEntityName" is the name of your entity
                    let fetchRequest: NSFetchRequest<EventUUID> = EventUUID.fetchRequest()
                    
                    do {
                        // Fetch all objects of the entity
                        let objects = try self.context.fetch(fetchRequest)
                        
                        // Iterate through the objects and delete each one
                        for object in objects {
                            self.context.delete(object)
                        }
                        
                        // Save the changes to the persistent store
                        try self.context.save()
                        
                        let toast = ToastView(message: "¡La base de datos se ha borrado!")
                        toast.show(in: self.mainView!)
                        
                    } catch {
                        // Handle the error appropriately
                        print("Error deleting data: \(error)")
                    }
                    
                })
                alertController.addAction(okAction)
                
                // Add Cancel action
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                    // Handle Cancel button tap
                    print("Cancel button tapped")
                })
                alertController.addAction(cancelAction)
                
                // Present the alert dialog
                present(alertController, animated: true, completion: nil)
                
            }
            
        }
        catch {
            print("Failed to load all your tasks!")
        }
    }
    
    @objc func historial(){
        mainRouter?.routeToHistorial(navigationController: navigationController!)
    }
    
    @objc func resetearEvento(){
        
        let alertController = UIAlertController(title: "Borrar este EVENTO.", message: "Esta acción borrará el evento y tendrás que registrar un nuevo evento.", preferredStyle: .alert)
        
        // Add OK action
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            // Handle OK button tap
            
            Storage.shared.storageSaveEventUUID(eventUUID: "")
            Storage.shared.storageSaveEventName(eventUUID: "")
            Storage.shared.storageSaveEventEventName(eventUUID: "")
            
            //move to register view...
            Storage.shared.storageDeviceSaveRegistered(registered: false)
            Storage.shared.storageSaveTestMode(testMode: false)
            
            self.navigationController?.popToViewController(ofClass: RegisterDeviceViewController.self)
            
            
            let toast = ToastView(message: "¡Se ha borrado el evento!")
            toast.show(in: self.mainView!)
            
        })
        alertController.addAction(okAction)
        
        // Add Cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            // Handle Cancel button tap
            print("Cancel button tapped")
        })
        alertController.addAction(cancelAction)
        
        // Present the alert dialog
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @objc func listadoEventos(){
        mainRouter?.routeToListadoEventos(navigationController: navigationController!)
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


