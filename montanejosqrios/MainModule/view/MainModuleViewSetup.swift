//
//  MainModuleViewSetup.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//

import UIKit

// MARK: - UI Setup
extension MainModuleView {
    
    func setupMainUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        //let size = CGSize(width: self.frame.width, height: .infinity)
        
        self.backgroundColor = Colors.white.getColor
        
        //let size = CGSize(width: self.frame.width, height: .infinity)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width * 0.97
        let enterExitWidth = screenSize.width * 0.90
        let cardWidth = screenSize.width * 0.90
        
        self.addSubview(registeredLabel)
        self.addSubview(montanejosImage)
        self.addSubview(settingsImage)
        
        self.addSubview(cardView)
        cardView.addSubview(nombreTerminalLabel)
        
        self.addSubview(cardView1)
        cardView1.addSubview(statusLabel)
        
        self.addSubview(enterImage)
        self.addSubview(exitImage)
        self.addSubview(backImage)
        self.addSubview(versionLabel)
        
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
                top: registeredLabel.bottomAnchor,
                leading: nil,
                bottom: nil,
                trailing: nil,
                padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                size: CGSize(width: 220, height: 153))
            
        }
        
        settingsImage.anchor(top: self.safeAreaLayoutGuide.topAnchor,
                          leading: nil,
                          bottom: nil,
                          trailing: self.safeAreaLayoutGuide.trailingAnchor,
                          padding: UIEdgeInsets(top: 56, left: 0, bottom: 0, right: 20),
                          size: CGSize(width: 40, height: 40))
        
        registeredLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        registeredLabel.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 50))
        
        cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardView.anchor(
            top: registeredLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0),
            size: CGSize(width: cardWidth, height: 60))
        
        nombreTerminalLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        nombreTerminalLabel.anchor(
            top: cardView.safeAreaLayoutGuide.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0),
            size: CGSize(width: cardWidth, height: 50))
        
        
        cardView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardView1.anchor(
            top: cardView.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0),
            size: CGSize(width: cardWidth, height: 60))
        
        statusLabel.centerXAnchor.constraint(equalTo: cardView1.centerXAnchor).isActive = true
        statusLabel.anchor(
            top: cardView1.safeAreaLayoutGuide.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 50))
         
        enterImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        enterImage.anchor(
            top: cardView1.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 30, left: 40, bottom: 0, right: 40),
            size: CGSize(width: enterExitWidth, height: 153))
        
        exitImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        exitImage.anchor(
            top: enterImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 30, left: 40, bottom: 0, right: 40),
            size: CGSize(width: enterExitWidth, height: 153))
        
        
        backImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backImage.anchor(top: nil,
                         leading: nil,
                         bottom: versionLabel.topAnchor,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0),
                         size: CGSize(width: 80, height: 40))
        
        versionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        versionLabel.anchor(
            top: nil,
            leading: nil,
            bottom: self.safeAreaLayoutGuide.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 40))
        
    }
}
