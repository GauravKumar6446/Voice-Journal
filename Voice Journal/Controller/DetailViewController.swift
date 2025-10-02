//
//  DetailViewController.swift
//  Voice Journal
//
//  Created by Gaurav Kumar on 02/10/25.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: -VARIABLES-
    var titleText : String = ""
    var text : String = ""
    var time : String = ""
    //MARK: -OUTLETS-
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var timelbl: UILabel!
    
    //MARK: -VIEWCONTROLLER LIFE CYCLE-
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        topView.roundCornerBottom(10)
        topView.dropShadowCustom(shadowColor: .appColor(.black,alpha: 0.3))
        titleLbl.setAppFontColor(.appColor(.black), font: .Montserrat(.bold, size: .oneThree))
        
        textView.textColor = .appColor(.black,alpha: 0.6)
        textView.font = UIFont.Montserrat(.regular, size: .oneThree)
        textView.isEditable = false
        timelbl.setAppFontColor(.appColor(.black, alpha: 0.5), font: .Montserrat(.italic, size: .oneTwo))
        
        textView.text = text
        timelbl.text = time
        titleLbl.text = titleText
        
    }
  
}
