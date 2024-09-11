import UIKit

class TransferViewController: UIViewController {
    let profileVc = MoreProfileVC()
    
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

            // Recipient Info Section
            let recipientSection = createRecipientInfoSection()
            view.addSubview(recipientSection)
            
            NSLayoutConstraint.activate([
                recipientSection.topAnchor.constraint(equalTo: amountSection.bottomAnchor, constant: 32),
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
            
            let amountLabel = UILabel()
            amountLabel.text = "1000"
            amountLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
            amountLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
            
            let stack = UIStackView(arrangedSubviews: [titleLabel, amountLabel])
            stack.axis = .vertical
            stack.spacing = 8
            
            container.addSubview(stack)
            stack.translatesAutoresizingMaskIntoConstraints = false
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
            
            let nameField = createTextField(placeholder: "Enter Recipient Name")
            let accountField = createTextField(placeholder: "Enter Recipient Account Number")
            
            let stack = UIStackView(arrangedSubviews: [titleLabel, nameField, accountField])
            stack.axis = .vertical
            stack.spacing = 16
            
            container.addSubview(stack)
            stack.translatesAutoresizingMaskIntoConstraints = false
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
                textField.heightAnchor.constraint(equalToConstant: 50),
            ])
            return container
        }
        
        func createContinueButton() -> UIButton {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Continue", for: .normal)
            button.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
            button.layer.cornerRadius = 6
            return button
        }
    }
    
//    // MARK: - UI Components
//    let amountLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Amount"
//        label.font = UIFont(name: "Inter", size: 16)
//        label.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
//        return label
//    }()
//
//    let amountTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "1000"
//        textField.font = UIFont(name: "Inter-Semibold", size: 20)
//        textField.textAlignment = .center
//        textField.layer.borderColor = UIColor(red: 0.54, green: 0.53, blue: 0.53, alpha: 1.0).cgColor
//        textField.layer.borderWidth = 0.5
//        textField.layer.cornerRadius = 8
//        textField.setPadding()
//        return textField
//    }()
//
//    let recipientInfoLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Recipient Information"
//        label.font = UIFont(name: "Inter-Medium", size: 16)
//        label.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
//        return label
//    }()
//
//    let recipientNameField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter Recipient Name"
//        textField.font = UIFont(name: "Inter", size: 14)
//        textField.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0)
//        textField.layer.borderWidth = 0.75
//        textField.layer.borderColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0).cgColor
//        textField.layer.cornerRadius = 6
//        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
//        textField.setPadding()
//        return textField
//    }()
//
//    let recipientAccountField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter Recipient Account Number"
//        textField.font = UIFont(name: "Inter", size: 14)
//        textField.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0)
//        textField.layer.borderWidth = 0.75
//        textField.layer.borderColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0).cgColor
//        textField.layer.cornerRadius = 6
//        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
//        textField.setPadding()
//        return textField
//    }()
//
//    let continueButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Continue", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
//        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 16)
//        button.layer.cornerRadius = 6
//        return button
//    }()
//
//    // MARK: - View Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        profileVc.backgroundColor(to: self.view)
//        setupViews()
//        setupConstraints()
//    }
//
//    // MARK: - Setup Views
//    func setupViews() {
//        view.addSubview(amountLabel)
//        view.addSubview(amountTextField)
//        view.addSubview(recipientInfoLabel)
//        view.addSubview(recipientNameField)
//        view.addSubview(recipientAccountField)
//        view.addSubview(continueButton)
//    }
//
//    // MARK: - Setup Constraints
//    func setupConstraints() {
//        amountLabel.translatesAutoresizingMaskIntoConstraints = false
//        amountTextField.translatesAutoresizingMaskIntoConstraints = false
//        recipientInfoLabel.translatesAutoresizingMaskIntoConstraints = false
//        recipientNameField.translatesAutoresizingMaskIntoConstraints = false
//        recipientAccountField.translatesAutoresizingMaskIntoConstraints = false
//        continueButton.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            // Amount Label Constraints
//            amountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            // Amount TextField Constraints
//            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 10),
//            amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            amountTextField.heightAnchor.constraint(equalToConstant: 46),
//
//            // Recipient Info Label Constraints
//            recipientInfoLabel.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 30),
//            recipientInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            recipientInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            // Recipient Name Field Constraints
//            recipientNameField.topAnchor.constraint(equalTo: recipientInfoLabel.bottomAnchor, constant: 10),
//            recipientNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            recipientNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            recipientNameField.heightAnchor.constraint(equalToConstant: 46),
//
//            // Recipient Account Field Constraints
//            recipientAccountField.topAnchor.constraint(equalTo: recipientNameField.bottomAnchor, constant: 10),
//            recipientAccountField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            recipientAccountField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            recipientAccountField.heightAnchor.constraint(equalToConstant: 46),
//
//            // Continue Button Constraints
//            continueButton.topAnchor.constraint(equalTo: recipientAccountField.bottomAnchor, constant: 30),
//            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            continueButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//
//
//}
//// Helper extension to add padding to UITextField
//extension UITextField {
//    func setPadding() {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//    }
//}
