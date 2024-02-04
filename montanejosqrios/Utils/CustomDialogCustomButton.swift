//
//  CustomDialogCustomButton.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//

import UIKit

class CustomDialogCustomButton {
    
    
    func customButton(titleString : String, color: UIColor, borderColor: CGColor, textSize: CGFloat) -> UIButton{
        
        let customButton: UIButton = {
            let button = UIButton(type: .system)
            
            button.backgroundColor = .clear
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = borderColor
            button.clipsToBounds = true
            button.setTitle(titleString, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: textSize)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = color
            button.translatesAutoresizingMaskIntoConstraints = false
            button.isUserInteractionEnabled = true
            return button
        }()
        
        return customButton
    }
}

