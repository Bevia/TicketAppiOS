//
//  ListadoEventosView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit

class ListadoEventosView: UIView {
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("setupMainUI")
        
        
        setupListadoEventosViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Items
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    /// ****************************************************************************

    lazy var montanejosImage: UIImageView = {
        let imageView = UIImageView()
        let catImage = UIImage(named: "montanejos")
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.image = catImage
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    lazy var titleLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 22,
                numberOfLines: 0)
        
        return center_label
    }()
    
    /*
     table view
     */
    
    
    lazy var tableView: UITableView = {
        let eventsTableView = UITableView()
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        return eventsTableView
        
    }()
    
    
    lazy var backImage: UIImageView = {
        let theDotImageView = UIImageView()  //you need to make this clickable...
        theDotImageView.image = UIImage(named: "arrow_light_left.png")
        theDotImageView.frame = CGRect(x: 0, y: 0, width:80, height: 40)
        return theDotImageView
        
    }()
    
    
}

