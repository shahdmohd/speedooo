//
//  Settings.swift
//  try
//
//  Created by 1234 on 12/09/2024.
//

import UIKit

class Settings: UIViewController{
    
    
    
    let profilevc = MoreProfileVC()
    let icons : [String] = ["Group", "favorite"]
    let tasks : [String] = ["Transfer From Website", "Favourites"]
    let texts : [String] = ["Transfer From Website", "Favourites"]
    
@IBOutlet weak var settingTV: UITableView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
        profilevc.secondBackgroundColor(to: view.self)
        settingTV.register(UINib(nibName: "settingCell", bundle: nil), forCellReuseIdentifier: "settingCell")

        UINavigationBarAppearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        // Register custom cell
        settingTV.register(UINib(nibName: "settingCell", bundle: nil), forCellReuseIdentifier: "settingCell")
        
        settingTV.delegate = self
        settingTV.dataSource = self
     
      
        
        
        // Set the background color of the table view to clear
        settingTV.backgroundColor = UIColor.clear
              
        // Reload the table view to reflect the data
        settingTV.reloadData()
        
   
    


    }

    }
    

extension Settings: UITableViewDelegate, UITableViewDataSource {
    // This function is related to delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
    }
    
    // Both these functions are for Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! settingCell
        
        // Configure the cell with the corresponding text from the array
        let text = tasks[indexPath.row]
        let icon = icons[indexPath.row]
        let subtext = texts[indexPath.row]
        cell.configureCell(labels: Labels(title: text, image: icon, subLabel: subtext))
        cell.delegate = self
        return cell
    }
}
extension Settings: settingCellDelegate {
    func didTapcells(_ cell: settingCell) {
        // Find the index path of the selected cell
        if let indexPath = settingTV.indexPath(for: cell) {
            let selectedTask = tasks[indexPath.row]
            
            // Check for "Profile" task and navigate to MoreProfileVC
            if selectedTask == "Personal information" {
                let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
                               if let profileVC = storyboard.instantiateViewController(withIdentifier: "TransactionsVC") as? TransactionsVC {
                                   navigationController?.pushViewController(profileVC, animated: true)
                               }
                               
                           // Check for "Favourites" task and navigate to FavouriteVC
               } else if selectedTask == "Favourites" {
                   // Instantiate FavouriteVC using storyboard
                   let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
                   if let favouriteVC = storyboard.instantiateViewController(withIdentifier: "FavouriteVC") as? FavouriteVC {
                       navigationController?.pushViewController(favouriteVC, animated: true)
                   }
        }
    }
}
}




