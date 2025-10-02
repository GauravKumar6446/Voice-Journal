//
//  EmptyCellTableViewCell.swift
//  Voice Journal
//
//  Created by Gaurav Kumar on 02/10/25.
//

import UIKit

class EmptyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var Lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Lbl.setAppFontColor(.appColor(.green), font: .Montserrat(.boldItalic, size: .twoThree))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
