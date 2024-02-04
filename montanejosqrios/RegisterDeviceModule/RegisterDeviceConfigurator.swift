//
//  RegisterDeviceConfigurator.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//

import UIKit

class RegisterDeviceConfigurator {
    
    static func configureModule(viewController: RegisterDeviceViewController) {
       
        let mainView = RegisterDeviceView()
        let mainRouter = RegisterDeviceRouterImplementation()
      
        
        viewController.mainView = mainView
        viewController.mainRouter = mainRouter
        mainRouter.navigationController = viewController.navigationController
        
    
       
    }
}

