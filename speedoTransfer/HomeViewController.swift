import UIKit
import Alamofire
import Foundation

struct Transaction: Codable {
    let id: String
    let senderAccount: String
    let receiverName: String
    let status: String
    let amount: Double
}
func fetchTransactions(completion: @escaping ([Transaction]?) -> Void) {
    let url = "http://speedotransfer-backend-production-7875.up.railway.app/api/v1/account/getAllTransactions"
    
    AF.request(url)
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
        fetchTransactions { [weak self] transactions in
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
        view.addSubview(profileImageView)
        
        // Name Label
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        nameLabel.textColor = UIColor.black
        nameLabel.text = "Hello, Asmaa Dosuky" // Placeholder name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 48),
            profileImageView.heightAnchor.constraint(equalToConstant: 48),
            
            nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
        cell.titleLabel.text = "Transaction \(indexPath.row + 1)" // Placeholder transaction title
        cell.subtitleLabel.text = "Card used: Visa" // Placeholder card info
        cell.amountLabel.text = "EGP 500"
        cell.amountLabel.textColor = .red
        return cell
    }
    
    // Set the height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 83
    }
}
