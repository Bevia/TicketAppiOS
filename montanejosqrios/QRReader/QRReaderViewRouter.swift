//
//  QRReaderViewRouter.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 26/10/23.
//

import UIKit

protocol QRReaderViewRouter: AnyObject {
   
    var navigationController: UINavigationController? { get }
    func routeBackToMainView(navigationController: UINavigationController)
    
}

class QRReaderViewRouterImplementation: QRReaderViewRouter {
    weak var navigationController: UINavigationController?
    
    func routeBackToMainView(navigationController: UINavigationController) {
      
        //navigationController.popToRootViewController(animated: true)
        navigationController.popViewController(animated: true)
    
    }
    
}

