//
//  Colors.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//

import UIKit

public enum Colors{
    case centralBackgroundLiteBlueColor,
         registrateButton,
         yaSoyClienteButton,
         startButton,
         advanceArrowButton,
         backArrowButton,
         saludosCelestialesTxtColor,
         languagesButtonsColor,
         red,
         white,
         black,
         darkBlue,
         indigoBlue,
         grey,
         lightGrey
    
    //  let initViewViewColor = colorSelector?.colorWithHexString(hex: "#d6fff9")
    var getColor: UIColor{
        switch self {
        case .centralBackgroundLiteBlueColor:
            return TheColors().colorWithHexString(hex: "#BBC7EF")
        case .registrateButton:
            return TheColors().colorWithHexString(hex: "#6286E2")
        case .yaSoyClienteButton:
            return TheColors().colorWithHexString(hex: "#3DA683")
        case .startButton:
            return TheColors().colorWithHexString(hex: "#2353E6")
        case .advanceArrowButton:
            return TheColors().colorWithHexString(hex: "#148558")
        case .backArrowButton:
            return TheColors().colorWithHexString(hex: "#D1003A")
        case .saludosCelestialesTxtColor:
            return TheColors().colorWithHexString(hex: "#1A004D")
        case .languagesButtonsColor:
            return TheColors().colorWithHexString(hex: "#2957E0")
        case .red:
            return TheColors().colorWithHexString(hex: "#FF0000")
        case .white:
            return TheColors().colorWithHexString(hex: "#FFFFFF")
        case .black:
            return TheColors().colorWithHexString(hex: "#000000")
        case .darkBlue:
            return TheColors().colorWithHexString(hex: "#0C2340")
        case .indigoBlue:
            return TheColors().colorWithHexString(hex: "#283593")
        case .grey:
            return TheColors().colorWithHexString(hex: "#9e9e9e")
        case .lightGrey:
            return TheColors().colorWithHexString(hex: "#bdbdbd")
        }
    }
}

class TheColors{
    
    //I, vincent Bevia added this....looking good!!!
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
