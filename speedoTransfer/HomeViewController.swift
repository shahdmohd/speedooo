import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    static func create() -> HomeViewController {
        return HomeViewController()
    }
    
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let currentBalanceView = UIView()
    let balanceLabel = UILabel()
    let currentBalanceTitleLabel = UILabel()
    
    let recentTransactionsLabel = UILabel()
    let viewAllButton = UIButton()
    let tableView = UITableView()
    
    // Navigation bar container view
    //let navBarView = UIView()
    //let navBarItems = ["Home", "Transfer", "Transactions", "My Cards", "More"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupProfileSection()
        setupCurrentBalanceSection()
        setupRecentTransactionsSection()
        setupTableView()
        //setupNavigationBar()
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
            currentBalanceView.heightAnchor.constraint(equalToConstant: 100),
            
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
            recentTransactionsLabel.topAnchor.constraint(equalTo: currentBalanceView.bottomAnchor, constant: 16),
            recentTransactionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
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
            tableView.topAnchor.constraint(equalTo: recentTransactionsLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
    
//    private func setupNavigationBar() {
//        // Set up the navigation bar at the bottom
//        navBarView.backgroundColor = UIColor.white
//        navBarView.layer.cornerRadius = 24
//        navBarView.layer.shadowColor = UIColor.black.cgColor
//        navBarView.layer.shadowOpacity = 0.1
//        navBarView.layer.shadowOffset = CGSize(width: 0, height: -2)
//        navBarView.layer.shadowRadius = 8
//        navBarView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(navBarView)
//
//        NSLayoutConstraint.activate([
//            navBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            navBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            navBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            navBarView.heightAnchor.constraint(equalToConstant: 80)
//        ])
        
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .equalSpacing
//        stackView.alignment = .center
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        navBarView.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: 24),
//            stackView.trailingAnchor.constraint(equalTo: navBarView.trailingAnchor, constant: -24),
//            stackView.topAnchor.constraint(equalTo: navBarView.topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor)
//        ])
//
//        // Add nav bar items
//        for item in navBarItems {
//            let label = UILabel()
//            label.text = item
//            label.font = UIFont(name: "HelveticaNeue", size: 12)
//            label.textColor = UIColor.gray
//            label.textAlignment = .center
//            label.isUserInteractionEnabled = true
//
//            // Add tap gesture recognizer to navigate
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navBarItemTapped(_:)))
//            label.addGestureRecognizer(tapGesture)
//
//            stackView.addArrangedSubview(label)
//        }
//    }
//
//    @objc private func navBarItemTapped(_ sender: UITapGestureRecognizer) {
//        guard let label = sender.view as? UILabel, let item = label.text else { return }
//
//        if item == "Transfer" {
//            performSegue(withIdentifier: "TransferViewController", sender: self)
////        }else if item == "Transactions"{
////            performSegue(withIdentifier: "Transat", sender: self)
////        }
//    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // Placeholder count for transactions
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
        cell.titleLabel.text = "Transaction \(indexPath.row + 1)" // Placeholder transaction title
        cell.subtitleLabel.text = "Card used: Visa" // Placeholder card info
        cell.amountLabel.text = "-EGP 500" // Placeholder transaction amount
        return cell
    }
}

