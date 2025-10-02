//
//  JournalCellTableViewCell.swift
//  Voice Journal
//
//  Created by Gaurav Kumar on 02/10/25.
//

import UIKit

class JournalCellTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var journalLbl: UILabel!
    @IBOutlet weak var timeLBl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .clear
        selectionStyle = .none
        
        outerView.makeRoundCornerwithborder(20, bordercolor: .appColor(.black,alpha: 0.3), borderwidth: 0.5)
        titleLbl.setAppFontColor(.appColor(.black), font: .Montserrat(.semiBold, size: .oneFive))
        journalLbl.setAppFontColor(.appColor(.black, alpha: 0.5), font: .Montserrat(.italic, size: .oneTwo))
        timeLBl.setAppFontColor(.appColor(.black, alpha: 0.5), font: .Montserrat(.italic, size: .oneTwo))
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
