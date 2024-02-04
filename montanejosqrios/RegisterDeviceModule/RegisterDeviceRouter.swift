//
//  RegisterDeviceRouter.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//

import UIKit

protocol RegisterDeviceRouter: AnyObject {
   
    var navigationController: UINavigationController? { get }
    func routeToMainView(navigationController: UINavigationController)
    
}

class RegisterDeviceRouterImplementation: RegisterDeviceRouter {
    weak var navigationController: UINavigationController?
    

    func routeToMainView(navigationController: UINavigationController) {
        
        let viewController = MainModuleViewController()
        MainModuleConfigurator.configureModule(viewController: viewController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

