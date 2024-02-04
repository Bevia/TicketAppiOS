//
//  DatosEventosViewSetup.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 15/11/23.
//

import UIKit

// MARK: - UI Setup
extension DatosEventosView {
    
    func setupDatosEventosViewUI() {
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
        let cardHeight = screenSize.height * 0.58
        
        self.addSubview(montanejosImage)
        
        self.addSubview(eventNameLabel)
        self.addSubview(deviceNameLabel)
        
        self.addSubview(cardView)
        
        cardView.addSubview(AfluenciaTitleLabel)
        cardView.addSubview(AfluenciaPeopleInGlobalLabel)
        cardView.addSubview(AfluenciaPeopleInTodaylLabel)
        cardView.addSubview(AfluenciaPeopleOutGlobalLabel)
        cardView.addSubview(AfluenciaPeopleOutTodayLabel)
        
        cardView.addSubview(EventCapacityTitleLabel)
        cardView.addSubview(EventCapacityCurentLabel)
        cardView.addSubview(EventCapacityLimitLabel)
  
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
                size: CGSize(width: imageWidth + 80 , height: imageHeight + 50))
        } else {
            // Handle the case where the image couldn't be loaded or its width couldn't be determined.
            montanejosImage.anchor(
                top: self.safeAreaLayoutGuide.topAnchor,
                leading: nil,
                bottom: nil,
                trailing: nil,
                padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                size: CGSize(width: 120, height: 53))
            
        }
        
       
        eventNameLabel.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 50))
        
       
        deviceNameLabel.anchor(
            top: eventNameLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 40))
        
        /*
         
         */
        
        cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardView.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0),
            size: CGSize(width: cardWidth, height: cardHeight))
        
        AfluenciaTitleLabel.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 10).isActive = true
        AfluenciaTitleLabel.anchor(
            top: cardView.safeAreaLayoutGuide.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 50))
       
        AfluenciaPeopleInGlobalLabel.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20).isActive = true
        AfluenciaPeopleInGlobalLabel.anchor(
            top: AfluenciaTitleLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 40))
        
     
        AfluenciaPeopleInTodaylLabel.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20).isActive = true
        AfluenciaPeopleInTodaylLabel.anchor(
            top: AfluenciaPeopleInGlobalLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 40))
        
       
        AfluenciaPeopleOutGlobalLabel.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20).isActive = true
        AfluenciaPeopleOutGlobalLabel.anchor(
            top: AfluenciaPeopleInTodaylLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 40))
        
       
        AfluenciaPeopleOutTodayLabel.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20).isActive = true
        AfluenciaPeopleOutTodayLabel.anchor(
            top: AfluenciaPeopleOutGlobalLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left:20, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 40))
        
        
        EventCapacityTitleLabel.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 10).isActive = true
        EventCapacityTitleLabel.anchor(
            top: AfluenciaPeopleOutTodayLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 50))
        
        EventCapacityCurentLabel.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20).isActive = true
        EventCapacityCurentLabel.anchor(
            top: EventCapacityTitleLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 40))
        
        EventCapacityLimitLabel.leftAnchor.constraint(lessThanOrEqualTo: cardView.leftAnchor, constant: 20).isActive = true
        EventCapacityLimitLabel.anchor(
            top: EventCapacityCurentLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 40))
        
        
        
        /*
         
         */
        
        backImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backImage.anchor(top: nil,
                         leading: nil,
                         bottom: self.safeAreaLayoutGuide.bottomAnchor,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0),
                         size: CGSize(width: 80, height: 40))
        
        
    }
}

