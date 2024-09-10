//
//  My_cardsVC.swift
//  speedoTransfer
//
//  Created by 1234 on 08/09/2024.
//

import UIKit

class My_cardsVC: UIViewController {
    
    let profileVc = MoreProfileVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileVc.backgroundColor(to: self.view)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
