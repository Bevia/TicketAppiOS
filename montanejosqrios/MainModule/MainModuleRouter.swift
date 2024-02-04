//
//  MainModuleRouter.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//

import UIKit

protocol MainModuleRouter: AnyObject {
   
    var navigationController: UINavigationController? { get }
    func routeToQRView(navigationController: UINavigationController)
    func routeToSettingsView(navigationController: UINavigationController)
    func routeBackToMainView(navigationController: UINavigationController)
    func routeToEventDataStatus(navigationController: UINavigationController)
}

class MainModuleRouterImplementation: MainModuleRouter {
    weak var navigationController: UINavigationController?
    
    func routeToQRView(navigationController: UINavigationController) {
        
        let viewController = QRReaderViewController()
        QRReaderViewConfiguration.configureModule(viewController: viewController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToSettingsView(navigationController: UINavigationController) {
        
        let viewController = SettingsViewController()
        SettingsConfigurator.configureModule(viewController: viewController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToEventDataStatus(navigationController: UINavigationController) {
        
        let viewController = DatosEventosViewController()
        DatosEventosConfigurator.configureModule(viewController: viewController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeBackToMainView(navigationController: UINavigationController) {
      
        //navigationController.popToRootViewController(animated: true)
        navigationController.popViewController(animated: true)
    
    }
    
}


