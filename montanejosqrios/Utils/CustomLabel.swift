//
//  CustomLabel.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//

import UIKit

class CustomLabel {
    
    func customLabelAlignmentCenter(
        labelString : String,
        color: UIColor,
        font: UIFont,
        size: Int,
        numberOfLines: Int) -> UILabel{
        
        let Label: UILabel = {
            let lbl = UILabel()
            lbl.adjustsFontSizeToFitWidth = true
            lbl.text = labelString
            lbl.textColor = color
            lbl.font = font.withSize(CGFloat(size))
            lbl.numberOfLines = numberOfLines
            lbl.textAlignment = .center
            
            return lbl
        }()
        
        return Label
    }
    
    func customLabelAlignmentLeft(
        labelString : String,
        color: UIColor,
        font: UIFont,
        size: Int,
        numberOfLines: Int) -> UILabel{
        
        let Label: UILabel = {
            let lbl = UILabel()
            lbl.adjustsFontSizeToFitWidth = false
            lbl.text = labelString
            lbl.textColor = color
            lbl.font = font.withSize(CGFloat(size))
            lbl.numberOfLines = numberOfLines
            lbl.textAlignment = .left
           // lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width, height:lbl.intrinsicContentSize.height)
            return lbl
        }()
        
        return Label
    }
    
    func customLabelSizeToFit(
        labelString : String,
        color: UIColor,
        font: UIFont,
        size: Int,
        numberOfLines: Int) -> UILabel{
        
        let Label: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.adjustsFontForContentSizeCategory = true
            lbl.adjustsFontSizeToFitWidth = true
            lbl.text = labelString
            lbl.layer.contentsGravity = .center
            lbl.textColor = color
            lbl.lineBreakMode = .byWordWrapping
            lbl.font = font.withSize(CGFloat(size))
            lbl.numberOfLines = numberOfLines
            lbl.textAlignment = .center
            
            return lbl
        }()
        
        return Label
    }
    
    
    func customLabelNofontSizeToFit(
        labelString : String,
        color: UIColor,
        font: UIFont,
        size: Int,
        numberOfLines: Int) -> UILabel{
        
        let Label: UILabel = {
            let lbl = UILabel()
            lbl.adjustsFontSizeToFitWidth = false
            lbl.text = labelString
            lbl.textColor = color
            lbl.font = font.withSize(CGFloat(size))
            lbl.numberOfLines = numberOfLines
            lbl.textAlignment = .center
            
            return lbl
        }()
        
        return Label
    }
    
    
    func customTitleLabel(
        labelString : String,
        color: UIColor,
        font: UIFont,
        size: Int,
        numberOfLines: Int) -> UILabel{
        let Label: UILabel = {
            let lbl = UILabel()
            lbl.adjustsFontSizeToFitWidth = true
            lbl.text = labelString
            lbl.textColor = color
            lbl.clipsToBounds = true
            lbl.layer.masksToBounds = true
            lbl.adjustsFontSizeToFitWidth = true
            lbl.font = font.withSize(CGFloat(size))
            lbl.numberOfLines = numberOfLines
            lbl.textAlignment = .center
            
            return lbl
        }()
        
        return Label
    }
    
}
