//
//  ViewController.swift
//  NetflixCopy
//
//  Created by Neosoft1 on 03/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOUTLETS
    
    // TABLEVIEW
    @IBOutlet weak var tableView: UITableView!
    
    // LABEL
    
    // BUTTON
    
    
    // MARK: PROPERPTIES
    
    
    // MARK: FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initDelegates()
        setRegisters()
    }
    
    private func setuoUI() {
        
    }
    
    func setDelegate() {
        // TABLEVIEW
        
        // TEXTFIELD
    }
    
    func initDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerCell() {
        
    }
    
    func setRegisters(){
        let headerViewCell = UINib(nibName: "HeaderViewCell", bundle: nil)
        tableView.register(headerViewCell, forCellReuseIdentifier: "HeaderViewCell")
        let landscapeCell = UINib(nibName: "LandscapeCell", bundle: nil)
        tableView.register(landscapeCell, forCellReuseIdentifier: "LandscapeCell")
        let potraitCell = UINib(nibName: "PotraitCell", bundle: nil)
        tableView.register(potraitCell, forCellReuseIdentifier: "PotraitCell")
    }
    
}

// MARK: TABLEVIEW DELEGATE & DATASOURCE METHODS
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewCell.identifier, for: indexPath) as! HeaderViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: LandscapeCell.identifier, for: indexPath) as! LandscapeCell
            cell.nextPageDelegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: PotraitCell.identifier, for: indexPath) as! PotraitCell
            cell.nextPageDelegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: LandscapeCell.identifier, for: indexPath) as! LandscapeCell
            return cell
        default :
            print("")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: LandscapeCell.identifier, for: indexPath) as! LandscapeCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section{
        case 0:
            return 130
        case 1:
            return 190
        case 2:
            return 290
        case 3:
            return 190
        default :
            print("0")
        }
        return 190
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            print(0)
        case 1:
            return "TV Shows and Movies You Liked"
            
        case 2:
            return "My List"
            
        case 3:
            return "Recommended for You"
        default:
            print("Default")
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            
            headerView.textLabel?.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 20.0)
        }
    }
}


// MARK: PROTOCOL BODY

extension ViewController: NextPageDelegate{
    func nextPage(selectedStr: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nvc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        nvc?.movieSelected = selectedStr
        self.navigationController?.pushViewController(nvc!, animated: true)
    }
}
