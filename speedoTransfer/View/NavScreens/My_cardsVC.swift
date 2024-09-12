//
//  My_cardsVC.swift
//  speedoTransfer
//
//  Created by 1234 on 08/09/2024.
//

import UIKit

class My_cardsVC: UIViewController {
    
    static func create() -> My_cardsVC {
        return My_cardsVC()
        
    }
    let profilevc = MoreProfileVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MY Cards "
        // Do any additional setup after loading the view.
        profilevc.secondBackgroundColor(to: view.self)
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
