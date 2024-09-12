import UIKit
import Alamofire
import Foundation

struct Transaction: Codable {
    let id: Int
        let senderAccount: String
        let receiverName: String
        let receiverAccount: String
        let status: String
        let amount: Double
}
func fetchTransactions( completion: @escaping ([Transaction]?) -> Void) {
    let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJLQGdtYWlsLmNvbSIsImlhdCI6MTcyNjEzNDc5NSwiZXhwIjoxNzI2MTUyNzk1fQ.R_IRGyR2TQlOMX7VTDxRB9f9sidQ8LIq717IzmDjK80"

    let url = "http://speedotransfer-backend-production-7875.up.railway.app/api/v1/account/getAllTransactions"
    
    // Set up headers with the token
    let headers: HTTPHeaders = [
        "Authorization": "Bearer \(token)"
    ]
    
    AF.request(url,method: .get, headers: headers)
        .validate()
        .responseDecodable(of: [Transaction].self) { response in
            switch response.result {
            case .success(let transactions):
                completion(transactions)
            case .failure(let error):
                print("Error fetching transactions: \(error)")
                completion(nil)
            }
        }
}
class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static func create() -> HomeViewController {
        return HomeViewController()
    }
    private var transactions: [Transaction] = []

    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let currentBalanceView = UIView()
    let balanceLabel = UILabel()
    let currentBalanceTitleLabel = UILabel()
    
    let recentTransactionsLabel = UILabel()
    let viewAllButton = UIButton()
    let tableView = UITableView()
    
    let profileVc = MoreProfileVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileVc.secondBackgroundColor(to: self.view)

        fetchTransactions() { [weak self] transactions in
            DispatchQueue.main.async {
                self?.transactions = transactions ?? []
            }}
        view.backgroundColor = .white

        setupProfileSection()
        setupCurrentBalanceSection()
        setupRecentTransactionsSection()
        setupTableView()
        print(self.transactions)
    }
    
    private func setupProfileSection() {
        
        // Profile Image
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.tintColor = .gray
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true // Increase image size
        profileImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true // Increase image size
        
        // Welcome Label
        let welcomeLabel = UILabel()
        welcomeLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        welcomeLabel.textColor = UIColor.gray
        welcomeLabel.text = "Welcome" // Static welcome text
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Name Label
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        nameLabel.textColor = UIColor.black
        nameLabel.text = "Hello, Asmaa Dosuky" // Placeholder name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create vertical stack view for the labels
        let labelsStackView = UIStackView(arrangedSubviews: [welcomeLabel, nameLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 8 // Increase space between welcomeLabel and nameLabel
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Notification Icon
        let notificationImageView = UIImageView()
        notificationImageView.image = UIImage(systemName: "bell.fill")
        notificationImageView.tintColor = .gray
        notificationImageView.translatesAutoresizingMaskIntoConstraints = false
        notificationImageView.contentMode = .scaleAspectFit
        notificationImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        notificationImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        // Create horizontal stack view for the profile image, labels stack, and notification icon
        let mainStackView = UIStackView(arrangedSubviews: [profileImageView, labelsStackView, notificationImageView])
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.spacing = 16 // Space between the image, labels, and notification icon
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stack view to the view
        view.addSubview(mainStackView)
        
        // Set constraints for the main stack view
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }


    private func setupCurrentBalanceSection() {
        currentBalanceView.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        currentBalanceView.layer.cornerRadius = 8
        currentBalanceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentBalanceView)
        
        currentBalanceTitleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        currentBalanceTitleLabel.textColor = .white
        currentBalanceTitleLabel.text = "Current Balance"
        currentBalanceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceView.addSubview(currentBalanceTitleLabel)
        
        balanceLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        balanceLabel.textColor = .white
        balanceLabel.text = "EGP 10,000" // Placeholder balance
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalanceView.addSubview(balanceLabel)
        
        NSLayoutConstraint.activate([
            currentBalanceView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            currentBalanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            currentBalanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            currentBalanceView.heightAnchor.constraint(equalToConstant: 123),
            
            currentBalanceTitleLabel.topAnchor.constraint(equalTo: currentBalanceView.topAnchor, constant: 16),
            currentBalanceTitleLabel.leadingAnchor.constraint(equalTo: currentBalanceView.leadingAnchor, constant: 16),
            
            balanceLabel.topAnchor.constraint(equalTo: currentBalanceTitleLabel.bottomAnchor, constant: 8),
            balanceLabel.leadingAnchor.constraint(equalTo: currentBalanceView.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupRecentTransactionsSection() {
        // Recent Transactions Label
        recentTransactionsLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        recentTransactionsLabel.textColor = .black
        recentTransactionsLabel.text = "Recent Transactions"
        recentTransactionsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recentTransactionsLabel)
        
        // View All Button
        viewAllButton.setTitle("View All", for: .normal)
        viewAllButton.setTitleColor(UIColor.systemBlue, for: .normal)
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewAllButton)
        
        NSLayoutConstraint.activate([
            recentTransactionsLabel.topAnchor.constraint(equalTo: currentBalanceView.bottomAnchor, constant: 24),
            recentTransactionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            viewAllButton.centerYAnchor.constraint(equalTo: recentTransactionsLabel.centerYAnchor),
            viewAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "TransactionCell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: recentTransactionsLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16)
        ])
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // Placeholder count for transactions
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath)
        
        // Remove any existing subviews to avoid duplication
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Create the image view
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bank")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Create the labels
        let titleLabel = UILabel()
        titleLabel.text = "Transaction \(indexPath.row + 1)" // Example transaction title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Card used: Visa" // Example card info
        subtitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        subtitleLabel.textColor = .gray
        
        let amountLabel = UILabel()
        amountLabel.text = "EGP 500" // Example amount
        amountLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        amountLabel.textColor = .red
        amountLabel.textAlignment = .right
        
        // Create a vertical stack for the labels
        let labelsStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 4
        
        // Create the main horizontal stack view
        let mainStackView = UIStackView(arrangedSubviews: [imageView, labelsStackView, amountLabel])
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.spacing = 16
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stack view to the cell's content view
        cell.contentView.addSubview(mainStackView)
        
        // Set constraints for the stack view to fit the cell's content view
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            mainStackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
            mainStackView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -8)
        ])
        
        return cell
    }

    
    // Set the height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 83
    }
}
