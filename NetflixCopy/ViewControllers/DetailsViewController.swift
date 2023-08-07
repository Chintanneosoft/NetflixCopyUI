//
//  DetailsViewController.swift
//  NetflixCopy
//
//  Created by Neosoft1 on 04/08/23.
//

import UIKit
import Foundation

class DetailsViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var lbl: UILabel!
    
    var movieSelected = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgView.image = UIImage(named: movieSelected)
        lbl.text = movieSelected
    }
    
}
