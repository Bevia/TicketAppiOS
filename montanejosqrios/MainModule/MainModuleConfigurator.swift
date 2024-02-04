//
//  MainModuleConfigurator.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//

import UIKit

class MainModuleConfigurator {
    
    static func configureModule(viewController: MainModuleViewController) {
       
        let mainView = MainModuleView()
        let mainRouter = MainModuleRouterImplementation()
      
        
        viewController.mainView = mainView
        viewController.mainRouter = mainRouter
        mainRouter.navigationController = viewController.navigationController
    }
}
