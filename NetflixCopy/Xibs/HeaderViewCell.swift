//
//  HeaderViewCell.swift
//  NetflixCopy
//
//  Created by Neosoft1 on 04/08/23.
//

import UIKit

class HeaderViewCell: UITableViewCell {
    static let identifier = "HeaderViewCell"
    
    @IBOutlet weak var profileImng: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImng.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
