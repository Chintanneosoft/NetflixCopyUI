//
//  PotraitCarouselCell.swift
//  NetflixCopy
//
//  Created by Neosoft1 on 04/08/23.
//

import UIKit

class PotraitCarouselCell: UICollectionViewCell {
    static let identifier = "PotraitCarouselCell"
    
    var name = String()
    
    @IBOutlet weak var potraitImg: UIImageView!
    
    @IBOutlet weak var potraitBtn: UIButton!
    
    @IBOutlet weak var view: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 5.0 // You can adjust the value as per your preference
        view.clipsToBounds = true
        
//        setupUI()
    }
    
//    func setupUI() {
        
//        potraitImg.image = UIImage(named:  name)
//
//        potraitBtn.setTitle(name, for: .normal)
        
//    }

    
    
}
