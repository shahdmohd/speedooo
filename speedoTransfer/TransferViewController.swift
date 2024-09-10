import UIKit

class TransferViewController: UIViewController {

    // MARK: - UI Components
    let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "Amount"
        label.font = UIFont(name: "Inter", size: 16)
        label.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        return label
    }()

    let amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "1000"
        textField.font = UIFont(name: "Inter-Semibold", size: 20)
        textField.textAlignment = .center
        textField.layer.borderColor = UIColor(red: 0.54, green: 0.53, blue: 0.53, alpha: 1.0).cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 8
        textField.setPadding()
        return textField
    }()

    let recipientInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Recipient Information"
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        return label
    }()

    let recipientNameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Recipient Name"
        textField.font = UIFont(name: "Inter", size: 14)
        textField.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0)
        textField.layer.borderWidth = 0.75
        textField.layer.borderColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 6
        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        textField.setPadding()
        return textField
    }()

    let recipientAccountField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Recipient Account Number"
        textField.font = UIFont(name: "Inter", size: 14)
        textField.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0)
        textField.layer.borderWidth = 0.75
        textField.layer.borderColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 6
        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        textField.setPadding()
        return textField
    }()

    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 16)
        button.layer.cornerRadius = 6
        return button
    }()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    // MARK: - Setup Views
    func setupViews() {
        view.addSubview(amountLabel)
        view.addSubview(amountTextField)
        view.addSubview(recipientInfoLabel)
        view.addSubview(recipientNameField)
        view.addSubview(recipientAccountField)
        view.addSubview(continueButton)
    }

    // MARK: - Setup Constraints
    func setupConstraints() {
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        recipientInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        recipientNameField.translatesAutoresizingMaskIntoConstraints = false
        recipientAccountField.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Amount Label Constraints
            amountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Amount TextField Constraints
            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 10),
            amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            amountTextField.heightAnchor.constraint(equalToConstant: 46),

            // Recipient Info Label Constraints
            recipientInfoLabel.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 30),
            recipientInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recipientInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Recipient Name Field Constraints
            recipientNameField.topAnchor.constraint(equalTo: recipientInfoLabel.bottomAnchor, constant: 10),
            recipientNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recipientNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recipientNameField.heightAnchor.constraint(equalToConstant: 46),

            // Recipient Account Field Constraints
            recipientAccountField.topAnchor.constraint(equalTo: recipientNameField.bottomAnchor, constant: 10),
            recipientAccountField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recipientAccountField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recipientAccountField.heightAnchor.constraint(equalToConstant: 46),

            // Continue Button Constraints
            continueButton.topAnchor.constraint(equalTo: recipientAccountField.bottomAnchor, constant: 30),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Setup Navigation Bar
    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.title = "Transfer"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont(name: "Inter-Medium", size: 20) ?? UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        ]
    }

    @objc func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// Helper extension to add padding to UITextField
extension UITextField {
    func setPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
