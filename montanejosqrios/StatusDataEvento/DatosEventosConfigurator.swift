//
//  DatosEventosConfigurator.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 15/11/23.
//

import UIKit

class DatosEventosConfigurator {
    
    static func configureModule(viewController: DatosEventosViewController) {
       
        let mainView = DatosEventosView()
        let mainRouter = DatosEventosRouterImplementation()
      
        
        viewController.mainView = mainView
        viewController.mainRouter = mainRouter
        mainRouter.navigationController = viewController.navigationController
    }
}
