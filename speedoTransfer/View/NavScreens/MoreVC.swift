
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
    let tasks : [String] = ["Transfer From Website", "Favourites", "Profile","Help", "Logout"]
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
        // Find the index path of the selected cell
        if let indexPath = moreTableView.indexPath(for: cell) {
            let selectedTask = tasks[indexPath.row]
            
            // Check for "Profile" task and navigate to MoreProfileVC
            if selectedTask == "Profile" {
                let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
                               if let profileVC = storyboard.instantiateViewController(withIdentifier: "MoreProfileVC") as? MoreProfileVC {
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
            else if selectedTask == "Logout" {
                            // Clear session data or user information
                            UserDefaults.standard.set(false, forKey: "isLoggedIn")
                            
                            // Instantiate the SignInViewController using the storyboard
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            if let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
                                
                                // Set the new root view controller to SignInViewController
                                if let window = UIApplication.shared.windows.first {
                                    window.rootViewController = UINavigationController(rootViewController: signInVC)
                                    window.makeKeyAndVisible()
                                    
                                    // Optionally, you can add a nice transition effect
                                    let options: UIView.AnimationOptions = .transitionFlipFromLeft
                                    UIView.transition(with: window, duration: 0.5, options: options, animations: nil, completion: nil)
                                }
                            }
                        }

                }
            }
            }
