//
//  RegisterDeviceViewSetup.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//

import UIKit

// MARK: - UI Setup
extension RegisterDeviceView {
    
    func setupMainUI() {
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
        let buttonsWidth = screenSize.width * 0.50
        let screenHeight = screenSize.height * 0.22
 
        self.addSubview(registeredLabel)
        self.addSubview(montanejosImage)
        
        self.addSubview(selectAnEventLabel)
        self.addSubview(selectEventButton)
        self.addSubview(indicatorView)
        
        
        self.addSubview(messageLabel)
        self.addSubview(registrationEditText)
        //self.addSubview(cardView2)
        
        self.addSubview(registerButton)
        self.addSubview(tableView)
        self.addSubview(backImage)
        
        registeredLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        registeredLabel.anchor(
            top: self.safeAreaLayoutGuide.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 50))
        
        //montanejosImage.centerXAnchor.constraint(lessThanOrEqualTo: self.centerXAnchor).isActive = true
        //montanejosImage.centerYAnchor.constraint(lessThanOrEqualTo: self.centerYAnchor, constant: -50).isActive = true
        montanejosImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        let image = UIImage(named: "montanejos")
        if let imageSize = image?.size {
            // Now you have the width and height of the image in the 'imageSize' variable.
            let imageWidth = imageSize.width
            let imageHeight = imageSize.height
            
            // print("imageWidth: \(imageWidth)")
            // print("imageHeight: \(imageHeight)")
            
            montanejosImage.anchor(
                top: registeredLabel.bottomAnchor,
                leading: nil,
                bottom: nil,
                trailing: nil,
                padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                size: CGSize(width: imageWidth + 80 , height: imageHeight + 50))
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
        
        /*
        cardView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardView1.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0),
            size: CGSize(width: cardWidth, height: 150))
         */
        
        selectAnEventLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        selectAnEventLabel.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0),
            size: CGSize(width: textFieldsWidth, height: 50))
        
        selectEventButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        selectEventButton.anchor(
            top: selectAnEventLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: buttonsWidth, height: 50))
        
        /*
        cardView2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardView2.anchor(
            top: cardView1.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0),
            size: CGSize(width: cardWidth, height: 180))
         */
        
        messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        messageLabel.anchor(
            top: selectEventButton.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0),
            size: CGSize(width: textFieldsWidth, height: 0))
        
        registrationEditText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        registrationEditText.anchor(
            top: messageLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: textFieldsWidth, height: 40))
        
        registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        registerButton.anchor(
            top: nil,
            leading: nil,
            bottom: backImage.topAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0),
            size: CGSize(width: buttonsWidth, height: 50))
        
        
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableView.anchor(
            top: selectAnEventLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: tableViewWidth, height: screenHeight))
        
        indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicatorView.anchor(top: nil,
                         leading: nil,
                         bottom: nil,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0),
                         size: CGSize(width: 80, height: 80))
        
        
        backImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backImage.anchor(
            top: nil,
            leading: nil,
            bottom: self.safeAreaLayoutGuide.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0),
            size: CGSize(width: 80, height: 40))
        
    }
}
