//
//  HistorialConfigurator.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

//

import UIKit

class HistorialConfigurator {
    
    static func configureModule(viewController: HistorialViewController) {
       
        let mainView = HistorialView()
        let mainRouter = HistorialRouterImplementation()
      
        
        viewController.mainView = mainView
        viewController.mainRouter = mainRouter
        mainRouter.navigationController = viewController.navigationController
    }
}
