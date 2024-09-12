
//  ViewController.swift
//  try
//
//  Created by 1234 on 04/09/2024.
//


import UIKit
class MoreProfileVC: UIViewController {
    

    static func create() -> MoreProfileVC {
        return MoreProfileVC()
    }
    
    @IBOutlet weak var proficon: UIImageView!
    @IBOutlet weak var profTableView: UITableView!
    @IBOutlet weak var nameLabelprof: UILabel!
    
    
    let icons : [String] = ["Group", "favorite", "user","help"]
    let tasks : [String] = ["Personal Information", "Setting", "Payment History","My Favourite List"]
    let texts : [String] = ["Tyour info ", "Change settings", "View your Transactions","Help"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        secondBackgroundColor(to: self.view)
        profTableView.register(UINib(nibName: "moreProfileCell", bundle: nil), forCellReuseIdentifier: "moreProfileCell")

        UINavigationBarAppearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        // Register custom cell
        profTableView.register(UINib(nibName: "MoreTVCell", bundle: nil), forCellReuseIdentifier: "MoreTVCell")
        
        profTableView.delegate = self
        profTableView.dataSource = self
     
      
        
        
        // Set the background color of the table view to clear
        profTableView.backgroundColor = UIColor.clear
              
        // Reload the table view to reflect the data
        profTableView.reloadData()
        
   
    


    }



// MARK: - BackGround Color
public func secondBackgroundColor(to view: UIView) {
let gradientColor = UIColor.bankMasrGradient(frame: view.bounds)
view.layer.addSublayer(gradientColor)
view.layer.insertSublayer(gradientColor, at: 0)
}

// MARK: - BackGround Color
public func firstbackgroundColor(to view: UIView) {
let gradientColor = UIColor.firstBMGrad(frame: view.bounds)
view.layer.addSublayer(gradientColor)
view.layer.insertSublayer(gradientColor, at: 0)
}

}


extension MoreProfileVC: UITableViewDelegate, UITableViewDataSource {
    // This function is related to delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
    }
    
    // Both these functions are for Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreProfileCell", for: indexPath) as! moreProfileCell
        
        // Configure the cell with the corresponding text from the array
        let text = tasks[indexPath.row]
        let icon = icons[indexPath.row]
        let subtext = texts[indexPath.row]
        cell.configureCell(labels: Labels(title: text, image: icon, subLabel: subtext))
        cell.delegate = self
        return cell
    }
}
extension MoreProfileVC: profileCellDelegate {
    func didTapcell(_ cell: moreProfileCell) {
        // Find the index path of the selected cell
        if let indexPath = profTableView.indexPath(for: cell) {
            let selectedTask = tasks[indexPath.row]
            
            // Check for "Profile" task and navigate to MoreProfileVC
            if selectedTask == "Setting" {
                let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
                               if let profileVC = storyboard.instantiateViewController(withIdentifier: "Settings") as? Settings {
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






// UIColor extension for hex colors
extension UIColor {
    // Hex initializer
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    // Static method to get the bankMasr gradient
    static func bankMasrGradient(frame: CGRect) -> CAGradientLayer {
        let gradientColor = CAGradientLayer()
        gradientColor.frame = frame
        
        // Define the two colors for bankMasr
        gradientColor.colors = [
            UIColor(hex: "#FFF8E7").cgColor,  // Light Yellow
            UIColor(hex: "#FFEAEE").cgColor   // Soft Pink
        ]
        
        return gradientColor
    }
    static func firstBMGrad(frame: CGRect) -> CAGradientLayer {
        let gradientColor = CAGradientLayer()
        gradientColor.frame = frame
        
        // Define the two colors for bankMasr
        gradientColor.colors = [
            UIColor(hex: "#FFFFFF").cgColor,  // White
            UIColor(hex: "#FFEAEE").cgColor   // Soft Pink
        ]
        
        return gradientColor
    }
}
