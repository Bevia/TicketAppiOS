//
//  QRReaderViewConfiguration.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 26/10/23.
//

import UIKit

class QRReaderViewConfiguration {
    
    static func configureModule(viewController: QRReaderViewController) {
       
        let mainView = QRReaderView()
        let mainRouter = QRReaderViewRouterImplementation()
      
        
        viewController.mainView = mainView
        viewController.mainRouter = mainRouter
        mainRouter.navigationController = viewController.navigationController
    }
}

