//
//  ListadoEventosViewController.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit
import CoreData

class ListadoEventosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mainView: ListadoEventosView?
    var mainRouter: ListadoEventosRouter?
    
    let appDelegate = DataBaseHooks.shared.appDelegate
    let context = DataBaseHooks.shared.context
    var events = [EventUUID]()
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
        mainView.tableView.register(EventsTableViewCell.self, forCellReuseIdentifier: "EventsCell")
        
        //make back button clickable...
        let backViewGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(Backbutton(gesture:)))
        // add it to the image view;
        mainView.backImage.addGestureRecognizer(backViewGesture)
        mainView.backImage.isUserInteractionEnabled = true
        
        mainView.titleLabel.text = "Listado de eventos"
        
        listAllEvents()
      
    }
    
    func listAllEvents(){
        
        
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


