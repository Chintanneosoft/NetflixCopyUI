//
//  tableViewCell.swift
//  NetflixCopy
//
//  Created by Neosoft1 on 04/08/23.
//

import UIKit

class PotraitCell: UITableViewCell {

    
    static let identifier = "PotraitCell"
    var nextPageDelegate: NextPageDelegate?
    
    var potraitMovies = ["Batman vs Superman","Breaking Bad","Game Of Thrones","Inception","John Wick","Joker","Madmax","Stranger Things"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initDelegates()
        let potraitCarouselCell = UINib(nibName: "PotraitCarouselCell", bundle: nil)
        collectionView.register(potraitCarouselCell, forCellWithReuseIdentifier: "PotraitCarouselCell")
    }
    
    func initDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func nextPageFromPotrait(_ sender:UIButton){
        nextPageDelegate?.nextPage(selectedStr: potraitMovies[sender.tag])
    }
    
}
extension PotraitCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return potraitMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PotraitCarouselCell.identifier, for: indexPath) as! PotraitCarouselCell
        cell.potraitImg.image = UIImage(named: potraitMovies[indexPath.row])
        cell.potraitBtn.setTitleColor(UIColor.white, for: .normal)
        cell.potraitBtn.tag = indexPath.row
        cell.potraitBtn.addTarget(self, action: #selector(nextPageFromPotrait(_:)), for: .touchUpInside)
        
//        cell.name = potraitMovies[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.movieSelected = potraitMovies[indexPath.row]
    }
    
}
extension PotraitCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width/2.2, height:290)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            // Set the margins for the section (top, left, bottom, right)
            let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0)
            return sectionInsets
        }
}
