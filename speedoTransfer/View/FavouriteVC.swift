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

    
        // Register custom cell
        moreFavListTableView.register(UINib(nibName: "favListCell", bundle: nil), forCellReuseIdentifier: "favListCell"))
        
        moreFavListTableView.delegate = self
        moreFavListTableView.dataSource = self
     
        
        
        
        
        // Set the background color of the table view to clear
        moreTableView.backgroundColor = UIColor.clear
              
        // Reload the table view to reflect the data
        moreTableView.reloadData()
        
        // Set the gradient background
        profileVc.secondBackgroundColor(to: self.view)
}



extension MoreVC: UITableViewDelegate, UITableViewDataSource {
// This function is related to delegate
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  
}

// Both these functions are for Data Source
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
}


func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTVCell", for: indexPath) as! MoreTVCell
    
    // Configure the cell with the corresponding text from the array
    let text = tasks[indexPath.row]
    let icon = icons[indexPath.row]
    cell.configureCell(media: Media(title: text, image: icon))
    cell.delegate = self
    return cell
}
}
    
    
    
}
