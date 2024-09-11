import UIKit

class TransferViewController: UIViewController {

    private let profileVc = MoreProfileVC()
    
    static func create() -> TransferViewController {
        return TransferViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        profileVc.secondBackgroundColor(to: self.view)

        // Stepper Circles and Lines
        let stepperView = createStepperView()
        view.addSubview(stepperView)
        
        NSLayoutConstraint.activate([
            stepperView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stepperView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepperView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        // Amount Section
        let amountSection = createAmountSection()
        view.addSubview(amountSection)
        
        NSLayoutConstraint.activate([
            amountSection.topAnchor.constraint(equalTo: stepperView.bottomAnchor, constant: 32),
            amountSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            amountSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            amountSection.heightAnchor.constraint(equalToConstant: 100),
        ])

        // Favorites Button
        let favoritesButton = createFavoritesButton()
        view.addSubview(favoritesButton)
        
        NSLayoutConstraint.activate([
            favoritesButton.topAnchor.constraint(equalTo: amountSection.bottomAnchor, constant: 16),
            favoritesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            favoritesButton.widthAnchor.constraint(equalToConstant: 120),
            favoritesButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        // Recipient Info Section
        let recipientSection = createRecipientInfoSection()
        view.addSubview(recipientSection)
        
        NSLayoutConstraint.activate([
            recipientSection.topAnchor.constraint(equalTo: favoritesButton.bottomAnchor, constant: 32),
            recipientSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            recipientSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            recipientSection.heightAnchor.constraint(equalToConstant: 210),
        ])
        
        // Continue Button
        let continueButton = createContinueButton()
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: recipientSection.bottomAnchor, constant: 40),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func createStepperView() -> UIView {
        let container = UIStackView()
        container.axis = .horizontal
        container.spacing = 8
        container.alignment = .center
        container.translatesAutoresizingMaskIntoConstraints = false

        let stepper1 = createStepperCircle(text: "01", isActive: true)
        let stepper2 = createStepperCircle(text: "02", isActive: false)
        let stepper3 = createStepperCircle(text: "03", isActive: false)
        
        let line1 = createStepperLine(isActive: true)
        let line2 = createStepperLine(isActive: false)
        
        container.addArrangedSubview(stepper1)
        container.addArrangedSubview(line1)
        container.addArrangedSubview(stepper2)
        container.addArrangedSubview(line2)
        container.addArrangedSubview(stepper3)
        
        return container
    }
    
    func createStepperCircle(text: String, isActive: Bool) -> UIView {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Poppins-Medium", size: 20)
        label.textColor = isActive ? UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0) : .lightGray
        label.textAlignment = .center
        
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .white
        circle.layer.cornerRadius = 18
        circle.layer.borderWidth = 1.12
        circle.layer.borderColor = isActive ? UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0).cgColor : UIColor.lightGray.cgColor
        
        circle.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: circle.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: 36),
            circle.heightAnchor.constraint(equalToConstant: 36),
        ])
        
        return circle
    }
    
    func createStepperLine(isActive: Bool) -> UIView {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = isActive ? UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0) : .lightGray
        NSLayoutConstraint.activate([
            line.widthAnchor.constraint(equalToConstant: 85),
            line.heightAnchor.constraint(equalToConstant: 1.5),
        ])
        return line
    }
    
    func createAmountSection() -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.cornerRadius = 8
        container.layer.borderWidth = 0.5
        container.layer.borderColor = UIColor.lightGray.cgColor
        
        let titleLabel = UILabel()
        titleLabel.text = "Amount"
        titleLabel.font = UIFont(name: "Inter-Regular", size: 16)
        titleLabel.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        
        let amountTextField = UITextField()
        amountTextField.placeholder = "Enter amount"
        amountTextField.font = UIFont(name: "Inter-SemiBold", size: 20)
        amountTextField.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        amountTextField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        amountTextField.layer.cornerRadius = 6
        amountTextField.layer.borderWidth = 0.75
        amountTextField.layer.borderColor = UIColor.lightGray.cgColor
        amountTextField.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, amountTextField])
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])
        
        return container
    }
    
    func createRecipientInfoSection() -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.cornerRadius = 8
        
        let titleLabel = UILabel()
        titleLabel.text = "Recipient Information"
        titleLabel.font = UIFont(name: "Inter-Medium", size: 16)
        titleLabel.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        
        let nameField = createTextField(placeholder: "Recipient Name")
        let accountField = createTextField(placeholder: "Recipient Account Number")
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, nameField, accountField])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
        ])
        
        return container
    }
    
    func createTextField(placeholder: String) -> UIView {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont(name: "Inter-Regular", size: 14)
        textField.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.75
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        let container = UIView()
        container.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            textField.topAnchor.constraint(equalTo: container.topAnchor),
            textField.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }
    
    func createFavoritesButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Favorites", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func createContinueButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)

        view.addSubview(button)
        return button
    }
    @objc private func didTapContinueButton() {
           let confirmationVC = ConfirmationViewController()
           navigationController?.pushViewController(confirmationVC, animated: true)
        
       }
    
    @objc func favoritesButtonTapped() {
        let favoritesListView = FavoritesListViewController()
        favoritesListView.modalPresentationStyle = .popover
        favoritesListView.preferredContentSize = CGSize(width: 300, height: 300) // Set the desired size here
        
        if let popover = favoritesListView.popoverPresentationController {
            popover.sourceView = self.view
            popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popover.permittedArrowDirections = [] // No arrow direction for center placement
        }
        
        present(favoritesListView, animated: true, completion: nil)
    }

}
