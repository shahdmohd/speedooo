import UIKit

protocol CountrySelectionDelegate: AnyObject {
    func didSelectCountry(_ country: String)
}

class CountrySelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: CountrySelectionDelegate?
    
    let countries = ["Egypt", "USA", "Germany", "France", "Japan", "Canada", "Australia"]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // Table View DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "countryCell")
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    // Table View Delegate Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        delegate?.didSelectCountry(selectedCountry) // Pass the selected country back
        dismiss(animated: true, completion: nil) // Dismiss the popup
    }
}
