//
//  ConfirmationViewController.swift
//  speedoTransfer
//
//  Created by Karim Ahmed on 11/09/2024.
//

import UIKit

class ConfirmationViewController: UIViewController {
    let profilevc = MoreProfileVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirmation"
        
        profilevc.secondBackgroundColor(to: view.self)
        // Do any additional setup after loading the view.
    }
    

 
}
