//
//  LandscapeCarouselCell.swift
//  NetflixCopy
//
//  Created by Neosoft1 on 04/08/23.
//

import UIKit

class LandscapeCarouselCell: UICollectionViewCell {
    static let identifier = "LandscapeCarouselCell"

    @IBOutlet weak var landscapeImg: UIImageView!
    
    @IBOutlet weak var landscapeLbl: UILabel!
    
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 5.0 // You can adjust the value as per your preference
        view.clipsToBounds = true
    }

}
