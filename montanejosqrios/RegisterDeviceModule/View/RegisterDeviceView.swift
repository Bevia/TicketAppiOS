//
//  RegisterDeviceView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//

import UIKit

class RegisterDeviceView: UIView {
    
    
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
    
    /**
     select event subview
     */
    
    lazy var selectAnEventLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 20,
                numberOfLines: 0)
        
        return center_label
    }()
    
    let selectEventButton = CustomDialogCustomButton.init().customButton(
        titleString: "",
        color:  ButtonsBackgroundTintColor.register_button_blue.getColor,
        borderColor: ButtonsBackgroundTintColor.register_button_blue.getColor.cgColor,
        textSize: 21)
    
    
    //let cardView1 = CardView(frame: CGRect(x: 50, y: 50, width: 200, height: 150))
    
    
    /**
     Register edit text subview
     */
    
    
    lazy var messageLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 18,
                numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var registrationEditText: SDCTextField = {
        let registrationEditTextView = SDCTextField()  //you need to make this clickable...
        registrationEditTextView.placeholder = "   Teclea o copia UUID aquí"
        registrationEditTextView.leftViewMode = UITextField.ViewMode.always
        registrationEditTextView.keyboardType = UIKeyboardType.default
        registrationEditTextView.autocapitalizationType = .none
        registrationEditTextView.returnKeyType = UIReturnKeyType.done
        registrationEditTextView.clearButtonMode = UITextField.ViewMode.whileEditing;
        registrationEditTextView.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        registrationEditTextView.borderStyle = UITextField.BorderStyle.line
        registrationEditTextView.textColor = Colors.darkBlue.getColor
        registrationEditTextView.setCorner(radius: 5)
        registrationEditTextView.setBorder(width: 2, color: UIColor.black)
        registrationEditTextView.translatesAutoresizingMaskIntoConstraints = false
        return registrationEditTextView
        
    }()
    
    let registerButton = CustomDialogCustomButton.init().customButton(
        titleString: "",
        color:  ButtonsBackgroundTintColor.register_button_blue.getColor,
        borderColor: ButtonsBackgroundTintColor.register_button_blue.getColor.cgColor,
        textSize: 21)
    
    //let cardView2 = CardView(frame: CGRect(x: 50, y: 50, width: 200, height: 180))
    
    // MARK: - IndicatorView Component
    lazy var indicatorView: UIActivityIndicatorView = {
      let view = UIActivityIndicatorView(style: .large)
      view.color = .black
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    lazy var backImage: UIImageView = {
        let theDotImageView = UIImageView()  //you need to make this clickable...
        theDotImageView.image = UIImage(named: "arrow_light_left.png")
        theDotImageView.frame = CGRect(x: 0, y: 0, width:80, height: 40)
        return theDotImageView
        
    }()
    
    /*
     table view
     */
    
    
    lazy var tableView: UITableView = {
        let eventsTableView = UITableView() 
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        return eventsTableView
        
    }()
    
}
