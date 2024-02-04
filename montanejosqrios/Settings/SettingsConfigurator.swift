//
//  SettingsConfigurator.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//

import UIKit

class SettingsConfigurator {
    
    static func configureModule(viewController: SettingsViewController) {
       
        let mainView = SettingsView()
        let mainRouter = SettingsRouterImplementation()
      
        
        viewController.mainView = mainView
        viewController.mainRouter = mainRouter
        mainRouter.navigationController = viewController.navigationController
    }
}

