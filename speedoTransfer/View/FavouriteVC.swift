//
//  FavouriteVC.swift
//  speedoTransfer
//
//  Created by 1234 on 11/09/2024.
//

import UIKit

class FavouriteVC: UIViewController {
static func create() -> FavouriteVC {
        return FavouriteVC()
    }
    @IBOutlet weak var favLabel: UILabel!
    @IBOutlet weak var moreFavListTableView: UITableView!
    let profileVc = MoreProfileVC()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "Favourites"
        profileVc.secondBackgroundColor(to: self.view)
        moreFavListTableView.backgroundColor = UIColor.clear

        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
                navigationItem.leftBarButtonItem = backButton
            }
            
            @objc func backButtonTapped() {
                // Pop back to MoreVC
                navigationController?.popViewController(animated: true)
            }

}
