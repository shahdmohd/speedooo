import UIKit

class PaymentViewController: UIViewController {
    // MARK: - Properties
    private let successMessageLabel = UILabel()
    private let transferAmountLabel = UILabel()
    private let stepperStackView = UIStackView()
    private let fromCardView = UIView()
    private let toCardView = UIView()
    private let transferAmountView = UIView()
    private let backButton = UIButton()
    private let addToFavouriteButton = UIButton()
    private let bottomBar = UIView()
    
    let profilevc = MoreProfileVC()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        profilevc.secondBackgroundColor(to: view)
        
        // Update the transfer amount with the shared value
        //updateTransferAmount()
    }
    
    // MARK: - Setup View
    private func setupView() {
        view.backgroundColor = UIColor(red: 1, green: 0.97, blue: 0.90, alpha: 1.0)
        
        setupSuccessMessage()
        setupStepper()
        setupButtons()
        setupBottomBar()
    }

    // MARK: - Setup Success Message
    private func setupSuccessMessage() {
        successMessageLabel.text = "The Transfer was successful"
        successMessageLabel.font = UIFont(name: "Inter-Bold", size: 18)
        successMessageLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        successMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(successMessageLabel)
        NSLayoutConstraint.activate([
            successMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successMessageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }

    // MARK: - Update Transfer Amount
//    func updateTransferAmount() {
//        let amount = TransferManager.shared.transferAmount
//        transferAmountLabel.text = amount != nil ? "The transfer amount is \(amount!)" : "Amount not available"
//    }

    // MARK: - Setup Stepper
    private func setupStepper() {
        let stepperView = createStepperView()
        view.addSubview(stepperView)
        
        NSLayoutConstraint.activate([
            stepperView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepperView.topAnchor.constraint(equalTo: successMessageLabel.bottomAnchor, constant: 20)
        ])
    }

    func createStepperView() -> UIView {
        let container = UIStackView()
        container.axis = .horizontal
        container.spacing = 8
        container.alignment = .center
        container.translatesAutoresizingMaskIntoConstraints = false

        let stepper1 = createStepperCircle(text: "01", isActive: true)
        let stepper2 = createStepperCircle(text: "02", isActive: true)
        let stepper3 = createStepperCircle(text: "03", isActive: true)
        
        let line1 = createStepperLine(isActive: true)
        let line2 = createStepperLine(isActive: true)
        
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

    // MARK: - Setup Buttons
    private func setupButtons() {
        backButton.setTitle("Back to Home", for: .normal)
        backButton.titleLabel?.font = UIFont(name: "Inter", size: 16)
        backButton.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        backButton.layer.cornerRadius = 6
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        addToFavouriteButton.setTitle("Add to Favourite", for: .normal)
        addToFavouriteButton.titleLabel?.font = UIFont(name: "Inter", size: 16)
        let borderColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        addToFavouriteButton.layer.borderColor = borderColor.cgColor
        addToFavouriteButton.layer.borderWidth = 0.75
        addToFavouriteButton.layer.cornerRadius = 6
        addToFavouriteButton.setTitleColor(borderColor, for: .normal)
        addToFavouriteButton.backgroundColor = .clear
        addToFavouriteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addToFavouriteButton)
        
        // Setup transferAmountLabel
        transferAmountLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        transferAmountLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        transferAmountLabel.textAlignment = .center
        transferAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(transferAmountLabel)
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backButton.heightAnchor.constraint(equalToConstant: 56),
            
            addToFavouriteButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -16),
            addToFavouriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addToFavouriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addToFavouriteButton.heightAnchor.constraint(equalToConstant: 56),
            
            transferAmountLabel.topAnchor.constraint(equalTo: addToFavouriteButton.bottomAnchor, constant: 24),
            transferAmountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Setup Bottom Bar
    private func setupBottomBar() {
        bottomBar.backgroundColor = .white
        bottomBar.layer.cornerRadius = 24
        bottomBar.layer.shadowColor = UIColor(red: 0.18, green: 0.15, blue: 0.07, alpha: 0.05).cgColor
        bottomBar.layer.shadowRadius = 24
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomBar)
        
        NSLayoutConstraint.activate([
            bottomBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomBar.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
}
