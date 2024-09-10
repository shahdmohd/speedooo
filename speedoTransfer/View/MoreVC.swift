
//
//  ViewController.swift
//  try
//
//  Created by 1234 on 04/09/2024.
//


import UIKit

class MoreVC: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    let icons : [String] = ["Group", "favorite", "user","help", "logout"]
    let tasks : [String] = ["Transfer From Website", "Favourites", "Profile","Help", "logout"]
   // let media = Media()
    let profileVc = MoreProfileVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "More"
//        navigationController?.title
        UINavigationBarAppearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)
        ]
        
        tableView.delegate = self
        tableView.dataSource = self
        
      

        
        // Register custom cell
        tableView.register(UINib(nibName: "MoreTVCell", bundle: nil), forCellReuseIdentifier: "MoreTVCell")
        
        // Set the background color of the table view to clear
        tableView.backgroundColor = UIColor.clear
              
        // Reload the table view to reflect the data
        tableView.reloadData()
        
        // Set the gradient background
        profileVc.backgroundColor(to: self.view)
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
        
        return cell
    }
}
