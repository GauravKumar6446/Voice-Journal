

import Foundation
import UIKit

//TEXT FIELD MARGIN
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    func setLeftPaddingPointsWithImage(_ amount:CGFloat, image : UIImageView){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount + 20, height: self.frame.size.height))
        image.frame = CGRect(x: 10, y: 12, width: 25, height: 25)
        paddingView.addSubview(image)
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPointsWithImage(_ amount:CGFloat, image : UIImageView) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount + 10, height: self.frame.size.height))
        image.frame = CGRect(x: 0, y: 10, width: 25, height: 25)
        paddingView.addSubview(image)
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    // TEXT FIELF ICONS
    func setRightViewIcon(icon: UIImage) {
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        btnView.backgroundColor = .blue
        btnView.setImage(icon, for: .normal)
        btnView.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        self.rightViewMode = .always
        self.rightView = btnView
    }
    
    public func setAppFontColor(_ color:  UIColor, font: UIFont) {
        self.textColor = color
        self.font = font
    }
    public func setAttibuttedString(font: UIFont, font2: UIFont, color : UIColor, Color2: UIColor, str1 : String, str2: String) -> NSMutableAttributedString {
        
        let attrs1 = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor :color]
        let attrs2 = [NSAttributedString.Key.font : font2, NSAttributedString.Key.foregroundColor : Color2]
        let attStr1 = NSMutableAttributedString(string:"\(str1)", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attStr2 = NSMutableAttributedString(string:"\(str2)", attributes:attrs2 as [NSAttributedString.Key : Any])
        attStr1.append(attStr2)
        return attStr1
    }
}

extension UITextField {
func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 20, height: 20))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}

