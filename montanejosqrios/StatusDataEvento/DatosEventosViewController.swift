//
//  DatosEventosViewController.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 15/11/23.
//

import UIKit

class DatosEventosViewController: UIViewController, IDatosEventos {
    
    var mainView: DatosEventosView?
    var mainRouter: DatosEventosRouter?
    
    let datosEventosPresenter = DatosEventosPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view = mainView
        
        setupView()
        getDataStatus()
        
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
        
        mainView.eventNameLabel.text = Storage.shared.storageGetEventEventName()
        mainView.deviceNameLabel.text = Storage.shared.storageGetEventName()
        
        mainView.AfluenciaTitleLabel.text = "Afluencia"
        mainView.EventCapacityTitleLabel.text = "Capacidad del evento"
        
        
    }
    
    private func getDataStatus(){
        //datosEventosPresenter.setDatosEventosPresenter(delegate: self, event_uuid: Storage.shared.storageGetDeviceUUID())
        datosEventosPresenter.mockAPICall(delegate: self)
        
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
    /*
     {
     "people": {
     "in_global": 2209, #personas que han asistido al evento
     "in_today": 1, #personas que han asistido al evento hoy
     "out_global": 1, #personas que han salido del evento
     "out_today": 1 #personas que han salido del evento hoy
     },
     "event_capacity": {
     "current": 49, # capacidad actual del espacio (aforo - personas actualmente dentro (event_capacity.limite - (people.in_today -
     people.out_today))
     "limit": 50, # aforo del evento
     "temperature": "green" # actualmente sin uso, pero puede reflejar en colores (green, yellow, orange, red) dependiendo de lo cerca
     que estemos de alcanzar la capacidad máxima de aforo
     } }
     */
    
    struct Response: Codable {
        struct People: Codable {
            let inGlobal: Int
            let inToday: Int
            let outGlobal: Int
            let outToday: Int
            
            enum CodingKeys: String, CodingKey {
                case inGlobal = "in_global"
                case inToday = "in_today"
                case outGlobal = "out_global"
                case outToday = "out_today"
            }
        }
        
        struct EventCapacity: Codable {
            let current: Int
            let limit: Int
            let temperature: String
        }
        
        let people: People?
        let eventCapacity: EventCapacity?
        
        enum CodingKeys: String, CodingKey {
            case people
            case eventCapacity = "event_capacity"
        }
    }
    
    func datosEvento(data: Data?) {
        
        DispatchQueue.main.async {
            self.mainView?.AfluenciaPeopleInGlobalLabel.text = "Personal que han asistido al evento: 0"
            self.mainView?.AfluenciaPeopleInTodaylLabel.text = "Personal que han asistido al evento hoy: 0"
            self.mainView?.AfluenciaPeopleOutGlobalLabel.text = "Personal que han salido del evento: 0"
            self.mainView?.AfluenciaPeopleOutTodayLabel.text = "Personal que han salido del evento hoy: 0"
            
            self.mainView?.EventCapacityCurentLabel.text = "Capacidad actual del espacio: 0"
            self.mainView?.EventCapacityLimitLabel.text = "Aforo del evento: 0"
        }
        
        do {
            // Use JSONDecoder to decode the JSON data into your struct
            let eventData = try JSONDecoder().decode(Response.self, from: data!)
            // Now you can access the parsed data
            
            // Access parsed data
            if let people = eventData.people {
                print("In Global: \(people.inGlobal)")
                print("In Today: \(people.inToday)")
                print("Out Global: \(people.outGlobal)")
                print("Out Today: \(people.outToday)")
                
                DispatchQueue.main.async {
                    self.mainView?.AfluenciaPeopleInGlobalLabel.text = "Personal que han asistido al evento: \(people.inGlobal)"
                    self.mainView?.AfluenciaPeopleInTodaylLabel.text = "Personal que han asistido al evento hoy: \(people.inToday)"
                    self.mainView?.AfluenciaPeopleOutGlobalLabel.text = "Personal que han salido del evento: \(people.outGlobal)"
                    self.mainView?.AfluenciaPeopleOutTodayLabel.text = "Personal que han salido del evento hoy: \(people.outToday)"
                }
                
            } else {
                print("People data is absent.")
            }
            
            if let eventCapacity = eventData.eventCapacity {
                print("current in event Capacity: \(eventCapacity.current)")
                print("current in event Capacity: \(eventCapacity.limit)")
                print("current in event Capacity: \(eventCapacity.temperature)")
                
                DispatchQueue.main.async {
                    self.mainView?.EventCapacityCurentLabel.text = "Capacidad actual del espacio: \(eventCapacity.current)"
                    self.mainView?.EventCapacityLimitLabel.text = "Aforo del evento: \(eventCapacity.limit)"
                }
                
            }
            
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func showError(showError: String?) {
        let toast = ToastView(message: showError ?? "network error")
        toast.show(in: self.mainView!)
    }
    
}
