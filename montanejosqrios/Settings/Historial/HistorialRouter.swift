//
//  HistorialRouter.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit

protocol HistorialRouter: AnyObject {
   
    var navigationController: UINavigationController? { get }
    func routeBackToMainView(navigationController: UINavigationController)
    
}

class HistorialRouterImplementation: HistorialRouter {
    weak var navigationController: UINavigationController?
    
    func routeToRegisterQRView(navigationController: UINavigationController) {
        
        //let viewController = RegisterForQRController()
        //RegisterForQRConfigurator.configureRegistroProfesionalModule(viewController: viewController)
        
        //navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeBackToMainView(navigationController: UINavigationController) {
      
        //navigationController.popToRootViewController(animated: true)
        navigationController.popViewController(animated: true)
    
    }
    
    
}


