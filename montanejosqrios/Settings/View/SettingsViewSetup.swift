//
//  SettingsViewSetup.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//

import UIKit

// MARK: - UI Setup
extension SettingsView {
    
    func setupSettingsViewUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        //let size = CGSize(width: self.frame.width, height: .infinity)
        
        self.backgroundColor = Colors.white.getColor
        
        //let size = CGSize(width: self.frame.width, height: .infinity)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width * 0.97
        let textFieldsWidth = screenSize.width * 0.80
        let cardWidth = screenSize.width * 0.90
        let cardHeight = screenSize.height * 0.63
        
       // self.addSubview(titleLabel)
        self.addSubview(montanejosImage)
        
        self.addSubview(cardView)
        
        cardView.addSubview(text1Label)
        cardView.addSubview(button1)
        cardView.addSubview(text2Label)
        cardView.addSubview(button2)
        
        cardView.addSubview(deviceUUID)
        cardView.addSubview(deviceUUIDFromStorage)
        cardView.addSubview(deletingUUIDLabel)
        
        cardView.addSubview(text3Label)
        cardView.addSubview(button3)
        
        cardView.addSubview(text4Label)
        cardView.addSubview(button4)
        
        cardView.addSubview(text5Label)
        cardView.addSubview(button5)
        
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
        
        cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardView.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0),
            size: CGSize(width: cardWidth, height: cardHeight))
        
        /*
         
         space 1
         
         */
        
        text1Label.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: +20 ).isActive = true
        text1Label.anchor(
            top: cardView.safeAreaLayoutGuide.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 60, left: 50, bottom: 0, right: 0),
            size: CGSize(width: screenSize.width * 0.40, height: 50))
        
        button1.rightAnchor.constraint(lessThanOrEqualTo: cardView.rightAnchor, constant: -20).isActive = true
        //button1.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        button1.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 50),
            size: CGSize(width: screenSize.width * 0.30, height: 40))
        
        
        /*
         
         space 2
         
         */
        
        text2Label.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: +20 ).isActive = true
        text2Label.anchor(
            top: button1.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 50, bottom: 0, right: 0),
            size: CGSize(width: screenSize.width * 0.40, height: 50))
        
        button2.rightAnchor.constraint(lessThanOrEqualTo: cardView.rightAnchor, constant: -20).isActive = true
        //button1.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        button2.anchor(
            top: button1.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 50),
            size: CGSize(width: screenSize.width * 0.30, height: 40))
        
        /*
         Device UUID
         */
        
        
        deviceUUID.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20 ).isActive = true
        deviceUUID.anchor(
            top: button2.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0),
            size: CGSize(width: textFieldsWidth, height: 30))
        
        deviceUUIDFromStorage.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        deviceUUIDFromStorage.anchor(
            top: deviceUUID.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0),
            size: CGSize(width: textFieldsWidth, height: 30))
        
        /*
         about deleting uuid label
         */
        
        deletingUUIDLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        deletingUUIDLabel.anchor(
            top: deviceUUIDFromStorage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0),
            size: CGSize(width: textFieldsWidth, height: 0))
        
        /*
         
         space 3
         
         */
        
        text3Label.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20 ).isActive = true
        text3Label.anchor(
            top: deletingUUIDLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 50, bottom: 0, right: 0),
            size: CGSize(width: screenSize.width * 0.40, height: 50))
        
        button3.rightAnchor.constraint(lessThanOrEqualTo: cardView.rightAnchor, constant: -20).isActive = true
        //button1.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        button3.anchor(
            top: deletingUUIDLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 50),
            size: CGSize(width: screenSize.width * 0.30, height: 40))
        
        /*
         space 4
         */
        
        text4Label.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20 ).isActive = true
        text4Label.anchor(
            top: button3.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 50, left: 50, bottom: 0, right: 0),
            size: CGSize(width: screenSize.width * 0.40, height: 50))
        
        button4.rightAnchor.constraint(lessThanOrEqualTo: cardView.rightAnchor, constant: -20).isActive = true
        button4.anchor(
            top: button3.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 50),
            size: CGSize(width: screenSize.width * 0.30, height: 40))
        
        /*
         space 5
         */
        
        text5Label.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20 ).isActive = true
        text5Label.anchor(
            top: button4.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 50, bottom: 0, right: 0),
            size: CGSize(width: screenSize.width * 0.40, height: 50))
        
        button5.rightAnchor.constraint(lessThanOrEqualTo: cardView.rightAnchor, constant: -20).isActive = true
        button5.anchor(
            top: button4.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 50),
            size: CGSize(width: screenSize.width * 0.30, height: 40))
        
      
        backImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backImage.anchor(top: nil,
                         leading: nil,
                         bottom: self.safeAreaLayoutGuide.bottomAnchor,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0),
                         size: CGSize(width: 80, height: 40))
        
    }
}

