//
//  ListadoEventosContigurator.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit

class ListadoEventosContigurator {
    
    static func configureModule(viewController: ListadoEventosViewController) {
       
        let mainView = ListadoEventosView()
        let mainRouter = ListadoEventosRouterImplementation()
      
        
        viewController.mainView = mainView
        viewController.mainRouter = mainRouter
        mainRouter.navigationController = viewController.navigationController
    }
}
