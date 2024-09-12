import UIKit

class FavouriteVC: UIViewController {

    @IBOutlet weak var moreFavListTableView: UITableView!

    @IBOutlet weak var favLabel: UILabel!
    static func create() -> FavouriteVC {
        return FavouriteVC()
    }

    let users = [
        User(name: "Asmaa Dousuky", accountNumber: "AccountXXXX7890", bankImageName: "bank"),
        User(name: "Asmaa Dousuky", accountNumber: "AccountXXXX7890", bankImageName: "bank")
    ]
    let profileVc = MoreProfileVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favourite"
        moreFavListTableView.register(UINib(nibName: "favListCellTableViewCell", bundle: nil), forCellReuseIdentifier: "favListCellTableViewCell")
        moreFavListTableView.delegate = self
        moreFavListTableView.dataSource = self
        // Set the background color of the table view to clear
        moreFavListTableView.backgroundColor = UIColor.clear
              
        // Reload the table view to reflect the data
        moreFavListTableView.reloadData()
        
        // Set the gradient background
        profileVc.secondBackgroundColor(to: self.view)
    }
}

extension FavouriteVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favListCellTableViewCell", for: indexPath) as! favListCellTableViewCell
        let user = users[indexPath.row]
        cell.configureCell(user: user)
        cell.backgroundColor = UIColor.clear
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        // Perform action when row is selected
//    }
}
