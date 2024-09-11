import UIKit

class FavouriteVC: UIViewController {

    @IBOutlet weak var moreFavListTableView: UITableView!

    let users = [
        User(name: "User One", accountNumber: "1234567890", bankImageName: "bank1"),
        User(name: "User Two", accountNumber: "0987654321", bankImageName: "bank2")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        moreFavListTableView.register(UINib(nibName: "favListCellTableViewCell", bundle: nil), forCellReuseIdentifier: "favListCellTableViewCell")
        moreFavListTableView.delegate = self
        moreFavListTableView.dataSource = self
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
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Perform action when row is selected
    }
}
