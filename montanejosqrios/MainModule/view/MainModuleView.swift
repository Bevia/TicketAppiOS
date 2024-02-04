//
//  MainModuleView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//

import UIKit

class MainModuleView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("setupMainUI")
        
        
        setupMainUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Items
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    /// ****************************************************************************
    
    lazy var registeredLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 22,
                numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var montanejosImage: UIImageView = {
        let imageView = UIImageView()
        let catImage = UIImage(named: "montanejos")
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.image = catImage
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var settingsImage: UIImageView = {
        let theDotImageView = UIImageView()  //you need to make this clickable...
        theDotImageView.image = UIImage(named: "settings_light.png")
        theDotImageView.frame = CGRect(x: 0, y: 0, width:10, height: 10)
        return theDotImageView
        
    }()
    
    
    lazy var eventTitleLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 20,
                numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var eventNameLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 20,
                numberOfLines: 0)
        
        return center_label
    }()
    
    
    lazy var dateLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 20,
                numberOfLines: 0)
        
        return center_label
    }()
    
    let cardView = CardView(frame: CGRect(x: 50, y: 50, width: 200, height: 150))
    
    lazy var nombreTerminalLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 20,
                numberOfLines: 0)
        
        return center_label
    }()
    
    let cardView1 = CardView(frame: CGRect(x: 50, y: 50, width: 200, height: 150))
    
    lazy var statusLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 20,
                numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var enterImage: UIImageView = {
        let imageView = UIImageView()
        let catImage = UIImage(named: "enter")
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.image = catImage
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var exitImage: UIImageView = {
        let imageView = UIImageView()
        let catImage = UIImage(named: "exit")
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.image = catImage
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var backImage: UIImageView = {
        let theDotImageView = UIImageView()  //you need to make this clickable...
        theDotImageView.image = UIImage(named: "arrow_light_left.png")
        theDotImageView.frame = CGRect(x: 0, y: 0, width:80, height: 40)
        return theDotImageView
        
    }()
    
    lazy var versionLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 12,
                numberOfLines: 1)
        
        return center_label
    }()
  
}

