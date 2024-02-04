//
//  HistorialViewController.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit
import CoreData

class HistorialViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var mainView: HistorialView?
    var mainRouter: HistorialRouter?
    
    let appDelegate = DataBaseHooks.shared.appDelegate
    let context = DataBaseHooks.shared.context
    var qrData = [QRHistory]()
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view = mainView
        
        setupView()
      
    }
    
    private func setupView() {
        guard let mainView = mainView else { return }
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(QRHistoryTableViewCell.self, forCellReuseIdentifier: "QRHistoryTableViewCell")
        
        //make back button clickable...
        let backViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(Backbutton(gesture:)))
        // add it to the image view;
        mainView.backImage.addGestureRecognizer(backViewGesture)
        mainView.backImage.isUserInteractionEnabled = true
        
        mainView.titleLabel.text = "Historial"
        listAllQRData()
        
      
    }
    
    func listAllQRData(){
        
        
        let request = QRHistory.fetchRequest()
        
        // Create a sort descriptor based on the formattedDate property
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false) // false means last one first!
        
        // Set the sort descriptor for the fetch request
        request.sortDescriptors = [sortDescriptor]
        
        do {
            
            qrData = try context.fetch(request)
            
            if(qrData.isEmpty){
                let toast = ToastView(message: "no hay eventos")
                toast.show(in: self.mainView!)
                return
                
            }else{
                
                DispatchQueue.main.async {
                    self.mainView?.tableView.reloadData()
                }
            }
            
        }
        catch {
            print("Failed to load all your tasks!")
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



