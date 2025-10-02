

import Foundation
import UIKit


extension Float {
    
    var toInt:Int? {
        return Int(self)
    }
    var toDouble:Double? {
        return Double(self)
    }
    var toString:String {
        return "\(self)"
    }
}

extension UIFont {
    
    public enum MontserratType: String {
        case regular = "Regular"
        case v = "V"
        case black = "Black"
        case blackItalic = "BlackItalic"
        case bold = "Bold"
        case boldItalic = "BoldItalic"
        case extraBold = "ExtraBold"
        case extraBoldItalic = "ExtraBoldItalic"
        case extraLight = "ExtraLight"
        case extraLightItalic = "ExtraLightItalic"
        case italic = "Italic"
        case light = "Light"
        case lightItalic = "LightItalic"
        case medium = "Medium"
        case mediumItalic = "MediumItalic"
        case semiBold = "SemiBold"
        case semiBoldItalic = "SemiBoldItalic"
        case thin = "Thin"
        case thinItalic = "ThinItalic"
        
    }
    
    public enum FontSize: CGFloat {
        
        case five = 5
        case seven = 7
        case nine = 9
        case oneZero = 10
        case oneOne = 11
        case oneTwo = 12
        case oneThree = 13
        case oneFour = 14
        case oneFive = 15
        case oneSix = 16
        case oneSeven = 17
        case oneEight = 18
        case oneNine = 19
        case twoThree = 23
        case twoFour = 24
        case twoFive = 25
        case twoSeven = 27
        case twoOne = 21
        case threeTwo = 32
        case fourOne = 41
        case fourFive = 45
        case fiveNine = 59
        
    }
    
    static func Montserrat(_ type: MontserratType, size: FontSize) -> UIFont {
        return UIFont(
            name: "Montserrat-\(type.rawValue)",
            size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue
            )
    }
    
}
