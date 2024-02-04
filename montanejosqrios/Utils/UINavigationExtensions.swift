//
//  NavigationExtensions.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 4/12/23.
//


import UIKit

//used to go back to Registration view.
//usage:   self.navigationController?.popToViewController(ofClass: RegisterDeviceViewController.self)
///https://stackoverflow.com/questions/30003814/how-can-i-pop-specific-view-controller-in-swift
extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}
