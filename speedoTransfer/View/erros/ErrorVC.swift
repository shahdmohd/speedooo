//
//  ErrorVC.swift
//  speedoTransfer
//
//  Created by 1234 on 11/09/2024.
//

import UIKit

class ErrorVC: UIViewController {
    let profilevc = MoreProfileVC()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilevc.secondBackgroundColor(to: view.self)
        
    }
    

  

}
