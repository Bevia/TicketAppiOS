//
//  ListadoEventosViewSetup.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit

// MARK: - UI Setup
extension ListadoEventosView {
    
    func setupListadoEventosViewUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        //let size = CGSize(width: self.frame.width, height: .infinity)
        
        self.backgroundColor = Colors.white.getColor
        
        //let size = CGSize(width: self.frame.width, height: .infinity)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width * 0.97
        let tableViewWidth = screenSize.width * 0.88
        let textFieldsWidth = screenSize.width * 0.80
        let cardWidth = screenSize.width * 0.90
        let cardHeight = screenSize.height * 0.60
        let screenHeight = screenSize.height * 0.60
        
       // self.addSubview(titleLabel)
        self.addSubview(montanejosImage)
        self.addSubview(titleLabel)
        self.addSubview(tableView)
        self.addSubview(backImage)

        
        montanejosImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        let image = UIImage(named: "montanejos")
        if let imageSize = image?.size {
            // Now you have the width and height of the image in the 'imageSize' variable.
            let imageWidth = imageSize.width
            let imageHeight = imageSize.height
            
            // print("imageWidth: \(imageWidth)")
            // print("imageHeight: \(imageHeight)")
            
            montanejosImage.anchor(
                top: self.safeAreaLayoutGuide.topAnchor,
                leading: nil,
                bottom: nil,
                trailing: nil,
                padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                size: CGSize(width: imageWidth + 50 , height: imageHeight + 20))
        } else {
            // Handle the case where the image couldn't be loaded or its width couldn't be determined.
            montanejosImage.anchor(
                top: self.safeAreaLayoutGuide.topAnchor,
                leading: nil,
                bottom: nil,
                trailing: nil,
                padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                size: CGSize(width: 220, height: 153))
            
        }
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 50, bottom: 0, right: 0),
            size: CGSize(width: screenSize.width * 0.40, height: 50))
        
        
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableView.anchor(
            top: titleLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: tableViewWidth, height: screenHeight))
        
      
        backImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backImage.anchor(top: nil,
                         leading: nil,
                         bottom: self.safeAreaLayoutGuide.bottomAnchor,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0),
                         size: CGSize(width: 80, height: 40))
        
    }
}


