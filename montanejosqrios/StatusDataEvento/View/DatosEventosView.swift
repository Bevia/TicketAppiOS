//
//  DatosEventosView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 15/11/23.
//

import UIKit

class DatosEventosView: UIView {
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("setupMainUI")
        
        
        setupDatosEventosViewUI()
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
    
    
    lazy var eventNameLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentCenter(
            labelString: "",
            color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 22,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var deviceNameLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentCenter(
            labelString: "",
            color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 22,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var AfluenciaTitleLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentLeft(
            labelString: "",
            color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 20,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var AfluenciaPeopleInGlobalLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentLeft(
            labelString: "",
            color: ButtonsBackgroundTintColor.black.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 16,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var AfluenciaPeopleInTodaylLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentLeft(
            labelString: "",
            color: ButtonsBackgroundTintColor.black.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 16,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var AfluenciaPeopleOutGlobalLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentLeft(
            labelString: "",
            color: ButtonsBackgroundTintColor.black.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 16,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var AfluenciaPeopleOutTodayLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentLeft(
            labelString: "",
            color: ButtonsBackgroundTintColor.black.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 16,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var EventCapacityTitleLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentLeft(
            labelString: "",
            color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 20,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var EventCapacityCurentLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentLeft(
            labelString: "",
            color: ButtonsBackgroundTintColor.black.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 16,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var EventCapacityLimitLabel: UILabel = {
        let center_label =
        CustomLabel.init().customLabelAlignmentLeft(
            labelString: "",
            color: ButtonsBackgroundTintColor.black.getColor,
            font: UIFont(name: "Helvetica Neue", size: 0)!,
            size: 16,
            numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var backImage: UIImageView = {
        let theDotImageView = UIImageView()  //you need to make this clickable...
        theDotImageView.image = UIImage(named: "arrow_light_left.png")
        theDotImageView.frame = CGRect(x: 0, y: 0, width:80, height: 40)
        return theDotImageView
        
    }()
    
    
}
