

import Foundation
import UIKit
import AVFoundation



typealias alertActionHandler = ((UIAlertAction) -> ())?
typealias alertTextFieldHandler = ((UITextField) -> ())
typealias apiErrorHandler = ((_ index: Int, _ btnTitle: String) -> ())


//MARK: -ALERT FUNCTION LIKE BANNER-
extension UIViewController {
    func alert(message: String, title: String = "", compleation: (()->())? ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        //    alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now()+2.0) { [weak self] in
                guard self?.presentedViewController == alertController else { return }
                //self?.dismiss(animated: true, completion: nil)
                self?.dismiss(animated: true, completion: {
                    compleation?()
                })
            }
            
        }
    }
}


//MARK: -TOAST FUNCTION -
extension UIViewController {
    
    func showToast(message : String, font: UIFont) {
        
        //User interaction false
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.blue//UIColor.appColor(.b,alpha: 0.8)
        toastLabel.textColor = .appColor(.white)
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 10.0, delay: 1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            
            toastLabel.removeFromSuperview()
        })
    } }


//thumbnail extension
extension UIViewController {
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        return nil
    }
}

