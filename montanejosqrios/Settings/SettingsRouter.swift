//
//  SettingsRouter.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//

import UIKit

protocol SettingsRouter: AnyObject {
   
    var navigationController: UINavigationController? { get }
    func routeBackToMainView(navigationController: UINavigationController) 
    func routeToHistorial(navigationController: UINavigationController)
    func routeToListadoEventos(navigationController: UINavigationController)
    
}

class SettingsRouterImplementation: SettingsRouter {
    weak var navigationController: UINavigationController?
    
    func routeToHistorial(navigationController: UINavigationController) {
        
        let viewController = HistorialViewController()
        HistorialConfigurator.configureModule(viewController: viewController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
    func routeToListadoEventos(navigationController: UINavigationController) {
        
        let viewController = ListadoEventosViewController()
        ListadoEventosContigurator.configureModule(viewController: viewController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
  
    
    func routeBackToMainView(navigationController: UINavigationController) {
      
        //navigationController.popToRootViewController(animated: true)
        navigationController.popViewController(animated: true)
    
    }
    
}

