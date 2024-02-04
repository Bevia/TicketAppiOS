//
//  ButtonsBackgroundTintColor.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//

import UIKit

public enum ButtonsBackgroundTintColor{
    case green,
         lightGreen,
         lighterGreen,
         blue,
         lightBlue,
         lighterBlue,
         orange,
         lightOrange,
         lighterOrange,
         red,
         lightRed,
         teal900,
         teal800,
         teal700,
         teal600,
         teal500,
         teal400,
         yellow900,
         yellow800,
         yellow700,
         black,
         white,
         pink,
         lightPink,
         lighLightGreen,
         lightLightBlue,
         register_button_blue,
         registro_dispositivo_textview,
         registro_dispositivo_hint
    
    //  let initViewViewColor = colorSelector?.colorWithHexString(hex: "#d6fff9")
    var getColor: UIColor{
        switch self {
        case .green:
            return GetTheColors().colorWithHexString(hex: "#0D5C32") //done
        case .lightGreen:
            return GetTheColors().colorWithHexString(hex: "#1CA33B") //done
        case .lighterGreen:
            return GetTheColors().colorWithHexString(hex: "#63E6A9") //done
        case .blue:
            return GetTheColors().colorWithHexString(hex: "#071C95") //done
        case .lightBlue:
            return GetTheColors().colorWithHexString(hex: "#1953E5") //done
        case .lighterBlue:
            return GetTheColors().colorWithHexString(hex: "#6F89DE") //done
        case .orange:
            return GetTheColors().colorWithHexString(hex: "#FF6F00") //done
        case .lightOrange:
            return GetTheColors().colorWithHexString(hex: "#FF9800") //done
        case .lighterOrange:
            return GetTheColors().colorWithHexString(hex: "#FFB74D") //done
        case .red:
            return GetTheColors().colorWithHexString(hex: "#FF0000") //done
        case .lightRed:
            return GetTheColors().colorWithHexString(hex: "#EF5350") //done
        case .teal900:
            return GetTheColors().colorWithHexString(hex: "#004D40") //done
        case .teal800:
            return GetTheColors().colorWithHexString(hex: "#00695C") //done
        case .teal700:
            return GetTheColors().colorWithHexString(hex: "#00796B") //done
        case .teal600:
            return GetTheColors().colorWithHexString(hex: "#00897B") //done
        case .teal500:
            return GetTheColors().colorWithHexString(hex: "#009688") //done
        case .teal400:
            return GetTheColors().colorWithHexString(hex: "#26A69A") //done
        case .yellow900:
            return GetTheColors().colorWithHexString(hex: "#F57F17") //done
        case .yellow800:
            return GetTheColors().colorWithHexString(hex: "#F9A825") //done
        case .yellow700:
            return GetTheColors().colorWithHexString(hex: "#FBC02D") //done
        case .black:
            return GetTheColors().colorWithHexString(hex: "#000000") //done
        case .white:
            return GetTheColors().colorWithHexString(hex: "FFFFFF") //done
        case .pink:
            return GetTheColors().colorWithHexString(hex: "#e91e63") //done
        case .lightPink:
            return GetTheColors().colorWithHexString(hex: "ff6090") //done
        case .lighLightGreen:
            return GetTheColors().colorWithHexString(hex: "#c8e6c9") //done
        case .lightLightBlue:
            return GetTheColors().colorWithHexString(hex: "b3e5fc") //done
        case .register_button_blue:
            return GetTheColors().colorWithHexString(hex: "2800A3") //done
        case .registro_dispositivo_textview:
            return GetTheColors().colorWithHexString(hex: "4E00E9") //done
        case.registro_dispositivo_hint:
            return GetTheColors().colorWithHexString(hex: "3691F2") //done
            
        }
    }
}

class GetTheColors{
    
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
