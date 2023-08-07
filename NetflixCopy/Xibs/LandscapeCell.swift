//
//  tableViewCell.swift
//  NetflixCopy
//
//  Created by Neosoft1 on 04/08/23.
//

import UIKit
//import Foundation

protocol NextPageDelegate: NSObject {
    func nextPage(selectedStr: String)
}

class LandscapeCell: UITableViewCell {
    
    //MARK: Delegate var
    weak var nextPageDelegate: NextPageDelegate?
    
    //MARK: Properties
    static let identifier = "LandscapeCell"
    
    var landscapeMovies = ["BreakingBad","Forest Gump","Friends","Game of Thrones","Guarduans Of Galaxy","Mandalorian","StrangerThings"]
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: FUNCTIONS
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initDelegates()
        let landscapeCarouselCell = UINib(nibName: "LandscapeCarouselCell", bundle: nil)
        collectionView.register(landscapeCarouselCell, forCellWithReuseIdentifier: "LandscapeCarouselCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}


// MARK: COLLECTIONVIEW DELEGATE & DATASCOURCE METHODS
extension LandscapeCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landscapeMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LandscapeCarouselCell.identifier, for: indexPath) as! LandscapeCarouselCell
        cell.landscapeImg.image = UIImage(named: landscapeMovies[indexPath.row])
        cell.landscapeLbl.text = landscapeMovies[indexPath.row]
        cell.landscapeLbl.textColor = UIColor.white
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nextPageDelegate?.nextPage(selectedStr: landscapeMovies[indexPath.row])
    }
}


extension LandscapeCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width/1.7, height: 180)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
            return sectionInsets
        }
    
}
