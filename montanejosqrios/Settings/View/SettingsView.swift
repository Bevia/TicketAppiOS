//
//  SettingsView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/11/23.
//


import UIKit

class SettingsView: UIView {
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("setupMainUI")
        
        
        setupSettingsViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Items
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    /// ****************************************************************************
    
    let cardView = CardView(frame: CGRect(x: 50, y: 50, width: 200, height: 150))
    
    lazy var montanejosImage: UIImageView = {
        let imageView = UIImageView()
        let catImage = UIImage(named: "montanejos")
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.image = catImage
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    lazy var text1Label: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentLeft(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 18,
                numberOfLines: 0)
        
        return center_label
    }()
    
    
    let button1 = CustomDialogCustomButton.init().customButton(
        titleString: "",
        color:  ButtonsBackgroundTintColor.register_button_blue.getColor,
        borderColor: ButtonsBackgroundTintColor.register_button_blue.getColor.cgColor,
        textSize: 20)
    
    lazy var text2Label: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentLeft(
                labelString: "",
                color: ButtonsBackgroundTintColor.red.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 18,
                numberOfLines: 0)
        
        return center_label
    }()
    
    
    let button2 = CustomDialogCustomButton.init().customButton(
        titleString: "",
        color:  ButtonsBackgroundTintColor.red.getColor,
        borderColor: ButtonsBackgroundTintColor.red.getColor.cgColor,
        textSize: 20)
    
    
    lazy var deviceUUID: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentLeft(
                labelString: "",
                color: ButtonsBackgroundTintColor.teal700.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 18,
                numberOfLines: 1)
        
        return center_label
    }()
    
    lazy var deviceUUIDFromStorage: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.teal700.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 14,
                numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var deletingUUIDLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 18,
                numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var text3Label: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentLeft(
                labelString: "",
                color: ButtonsBackgroundTintColor.red.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 18,
                numberOfLines: 0)
        
        return center_label
    }()
    
    
    let button3 = CustomDialogCustomButton.init().customButton(
        titleString: "",
        color:  ButtonsBackgroundTintColor.red.getColor,
        borderColor: ButtonsBackgroundTintColor.red.getColor.cgColor,
        textSize: 20)
    
    lazy var text4Label: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentLeft(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 18,
                numberOfLines: 0)
        
        return center_label
    }()
    
    
    let button4 = CustomDialogCustomButton.init().customButton(
        titleString: "",
        color:  ButtonsBackgroundTintColor.register_button_blue.getColor,
        borderColor: ButtonsBackgroundTintColor.register_button_blue.getColor.cgColor,
        textSize: 20)
    
    
    lazy var text5Label: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentLeft(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 18,
                numberOfLines: 0)
        
        return center_label
    }()
    
    
    let button5 = CustomDialogCustomButton.init().customButton(
        titleString: "",
        color:  ButtonsBackgroundTintColor.red.getColor,
        borderColor: ButtonsBackgroundTintColor.red.getColor.cgColor,
        textSize: 20)
    
    

    
    lazy var backImage: UIImageView = {
        let theDotImageView = UIImageView()  //you need to make this clickable...
        theDotImageView.image = UIImage(named: "arrow_light_left.png")
        theDotImageView.frame = CGRect(x: 0, y: 0, width:80, height: 40)
        return theDotImageView
        
    }()
    
    
}
