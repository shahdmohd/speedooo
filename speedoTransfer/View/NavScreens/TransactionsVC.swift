
import UIKit

class TransactionsVC: UIViewController {
    let profileVc = MoreProfileVC()
    static func create() -> TransactionsVC {
        return TransactionsVC()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Transactions"
        view.backgroundColor = UIColor(red: 1, green: 0.97, blue: 0.90, alpha: 1)
        profileVc.secondBackgroundColor(to: self.view)

        setupHeaderView()
        setupTransactionScrollView()
    }
    
    private func setupHeaderView() {
        let headerLabel = UILabel()
        headerLabel.text = "Transactions"
        headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        headerLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        headerLabel.textAlignment = .center
        
        let subHeaderLabel = UILabel()
        subHeaderLabel.text = "Your Last Transactions"
        subHeaderLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        subHeaderLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        subHeaderLabel.textAlignment = .center
        
        view.addSubview(headerLabel)
        view.addSubview(subHeaderLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        subHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            
            subHeaderLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
            subHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subHeaderLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32)
        ])
    }
    
    private func setupTransactionScrollView() {
        let scrollView = UIScrollView()
        let contentView = UIView()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let transactionStackView = UIStackView()
        transactionStackView.axis = .vertical
        transactionStackView.spacing = 16
        transactionStackView.alignment = .fill
        transactionStackView.distribution = .fillEqually // Ensures all arrangedSubviews have equal size
        
        contentView.addSubview(transactionStackView)
        
        transactionStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            transactionStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            transactionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            transactionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            transactionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            transactionStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        // Sample transaction items
        for _ in 1...3 {
            let transactionView = createTransactionView()
            transactionStackView.addArrangedSubview(transactionView)
        }
    }
    
    private func createTransactionView() -> UIView {
        let transactionView = UIView()
        transactionView.backgroundColor = .white
        transactionView.layer.cornerRadius = 8
        transactionView.layer.shadowColor = UIColor(red: 0.42, green: 0.46, blue: 0.53, alpha: 0.10).cgColor
        transactionView.layer.shadowOffset = CGSize(width: 0, height: 4)
        transactionView.layer.shadowRadius = 10
        transactionView.layer.shadowOpacity = 1
        transactionView.layer.borderColor = UIColor(red: 0.95, green: 0.91, blue: 0.92, alpha: 1).cgColor
        transactionView.layer.borderWidth = 0.5
        
        // Set consistent size for all containers
        transactionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            transactionView.widthAnchor.constraint(equalToConstant: 343.50),
            transactionView.heightAnchor.constraint(equalToConstant: 121)
        ])
        
        let iconView = UIView()
        iconView.backgroundColor = UIColor(red: 0.95, green: 0.91, blue: 0.92, alpha: 1)
        iconView.layer.cornerRadius = 8
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bank")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: iconView.frame.width, height: iconView.frame.height)
        iconView.addSubview(imageView)
        
        let nameLabel = UILabel()
        nameLabel.text = "Ahmed Mohamed"
        nameLabel.font = UIFont(name: "Inter-Medium", size: 14)
        nameLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        
        let cardLabel = UILabel()
        cardLabel.text = "Visa . Master Card . 1234"
        cardLabel.font = UIFont(name: "Inter-Regular", size: 10)
        cardLabel.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1)
        
        let dateLabel = UILabel()
        dateLabel.text = "Today 11:00 -Recieved"
        dateLabel.font = UIFont(name: "Inter-Regular", size: 10)
        dateLabel.textColor = UIColor(red: 0.27, green: 0.23, blue: 0.22, alpha: 1)
        
        let amountLabel = UILabel()
        amountLabel.text = "$1000"
        amountLabel.font = UIFont(name: "Inter-Medium", size: 16)
        amountLabel.textColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1)
        
        let detailsStackView = UIStackView(arrangedSubviews: [nameLabel, cardLabel, dateLabel])
        detailsStackView.axis = .vertical
        detailsStackView.spacing = 2
        
        let stringsStackView = UIStackView(arrangedSubviews: [detailsStackView, amountLabel])
        stringsStackView.axis = .vertical
        stringsStackView.spacing = 4
        
        let StackView = UIStackView(arrangedSubviews: [iconView, detailsStackView])
        StackView.axis = .horizontal
        StackView.spacing = 4
        
        let statusLabel = UILabel()
        statusLabel.text = "Successful"
        statusLabel.font = UIFont(name: "Inter-Medium", size: 9.36)
        statusLabel.textColor = UIColor(red: 0.07, green: 0.54, blue: 0.19, alpha: 1)
        statusLabel.textAlignment = .center
        statusLabel.backgroundColor = UIColor(red: 0.92, green: 0.95, blue: 0.93, alpha: 1)
        statusLabel.layer.cornerRadius = 5.35
        statusLabel.layer.masksToBounds = true
        
    
        
        let transactionStackView = UIStackView(arrangedSubviews: [StackView, statusLabel])
        transactionStackView.axis = .horizontal
        transactionStackView.spacing = 24
        transactionStackView.alignment = .center
        transactionStackView.distribution = .fill
        
        transactionView.addSubview(transactionStackView)
        
        transactionStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            transactionStackView.leadingAnchor.constraint(equalTo: transactionView.leadingAnchor, constant: 16),
            transactionStackView.trailingAnchor.constraint(equalTo: transactionView.trailingAnchor, constant: -16),
            transactionStackView.topAnchor.constraint(equalTo: transactionView.topAnchor, constant: 8),
            transactionStackView.bottomAnchor.constraint(equalTo: transactionView.bottomAnchor, constant: -8)
        ])
        
        return transactionView
    }
}
