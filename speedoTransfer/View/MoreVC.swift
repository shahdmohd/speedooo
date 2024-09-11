
//
//  ViewController.swift
//  try
//
//  Created by 1234 on 04/09/2024.
//


import UIKit

class MoreVC: UIViewController {
    static func create() -> MoreVC {
        return MoreVC()
    }

    @IBOutlet var moreTableView: UITableView!
    
    let icons : [String] = ["Group", "favorite", "user","help", "logout"]
    let tasks : [String] = ["Transfer From Website", "Favourites", "Profile","Help", "logout"]
    let profileVc = MoreProfileVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "More"
        UINavigationBarAppearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        // Register custom cell
        moreTableView.register(UINib(nibName: "MoreTVCell", bundle: nil), forCellReuseIdentifier: "MoreTVCell")
        
        moreTableView.delegate = self
        moreTableView.dataSource = self
     
        
        
        
        
        // Set the background color of the table view to clear
        moreTableView.backgroundColor = UIColor.clear
              
        // Reload the table view to reflect the data
        moreTableView.reloadData()
        
        // Set the gradient background
        profileVc.secondBackgroundColor(to: self.view)
    }
    
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
extension MoreVC: MoreTVCellDelegate {
    func didTapCell(_ cell: MoreTVCell) {
        let indexPath = moreTableView.indexPath(for: cell)
                
                if let index = indexPath?.row, tasks[index] == "Profile" {
                    let profileVC = MoreProfileVC.create() // Create the profile view controller
                    navigationController?.pushViewController(profileVC, animated: true)
                }
            }
}
