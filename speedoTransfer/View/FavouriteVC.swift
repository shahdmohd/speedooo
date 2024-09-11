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
    let profileVc = MoreProfileVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        profileVc.secondBackgroundColor(to: self.view)
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
                navigationItem.leftBarButtonItem = backButton
            }
            
            @objc func backButtonTapped() {
                // Pop back to MoreVC
                navigationController?.popViewController(animated: true)
            }

}
