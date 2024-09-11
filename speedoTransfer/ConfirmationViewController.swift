import UIKit

class ConfirmationViewController: UIViewController {
    let profilevc = MoreProfileVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transfer"
        
        profilevc.secondBackgroundColor(to: view)
        setupUI()
        setupButtons() // Call the function to add the buttons
    }

    private func setupUI() {
        view.backgroundColor = .white
        
        // Navigation Bar
        let navBar = UIView()
        navBar.backgroundColor = .white
        view.addSubview(navBar)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        let titleLabel = UILabel()
        titleLabel.text = "Confirm Your Payment"
        titleLabel.font = UIFont(name: "Inter-Medium", size: 20)
        titleLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        navBar.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor)
        ])
        
        // Stepper Circles and Lines
        let stepStack = createStepperView()
        view.addSubview(stepStack)
        NSLayoutConstraint.activate([
            stepStack.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 24),
            stepStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Amount Section
        let amountLabel = UILabel()
        amountLabel.text = "1000 EGP"
        amountLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        amountLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        view.addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: stepStack.bottomAnchor, constant: 24),
            amountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Transfer Details
        let detailsStack = UIStackView()
        detailsStack.axis = .vertical
        detailsStack.spacing = 16
        detailsStack.alignment = .center // Center alignment for dynamic content
        view.addSubview(detailsStack)
        detailsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsStack.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 24),
            detailsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        // From & To Info
        let fromView = createInfoView(label: "From", name: "Asmaa Dosuky", account: "Account xxxx7890", color: UIColor(red: 0.95, green: 0.91, blue: 0.92, alpha: 1))
        let toView = createInfoView(label: "To", name: "Jonathon Smith", account: "Account xxxx7890", color: UIColor(red: 0.95, green: 0.91, blue: 0.92, alpha: 1))
        
        detailsStack.addArrangedSubview(fromView)
        detailsStack.addArrangedSubview(toView)
    }
    
    private func setupButtons() {
        // Create Previous Button
        let previousButton = createPreviousButton()
        view.addSubview(previousButton)
        NSLayoutConstraint.activate([
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            previousButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            previousButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Create Continue Button
        let continueButton = createContinueButton()
        view.addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: previousButton.topAnchor, constant: -16),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func createContinueButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        return button
    }
    
    @objc private func didTapContinueButton() {
        let paymentVC = PaymentViewController()
        navigationController?.pushViewController(paymentVC, animated: true)
    }
    
    func createPreviousButton() -> UIButton {
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("Previous", for: .normal)
        previousButton.setTitleColor(UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1), for: .normal)
        previousButton.layer.cornerRadius = 6
        previousButton.layer.borderColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1).cgColor
        previousButton.layer.borderWidth = 0.75
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        return previousButton
    
    previousButton.addTarget(self, action: #selector(didTappreviousButton), for: .touchUpInside)
    return previousButton
}


@objc private func didTappreviousButton() {
       let paymentVC = PaymentViewController()
       navigationController?.popViewController(animated: true)

   }
    private func createStepperView() -> UIStackView {
        let container = UIStackView()
        container.axis = .horizontal
        container.spacing = 24 // Spacing between circles
        container.alignment = .center
        container.translatesAutoresizingMaskIntoConstraints = false

        let stepper1 = createStepperCircle(text: "01", isActive: true)
        let stepper2 = createStepperCircle(text: "02", isActive: true)
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
    
    private func createStepperCircle(text: String, isActive: Bool) -> UIView {
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
    
    private func createStepperLine(isActive: Bool) -> UIView {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = isActive ? UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0) : .lightGray
        NSLayoutConstraint.activate([
            line.widthAnchor.constraint(equalToConstant: 85),
            line.heightAnchor.constraint(equalToConstant: 1.5),
        ])
        return line
    }
    private func createInfoView(label: String, name: String, account: String, color: UIColor) -> UIView {
        let container = UIView()
        container.backgroundColor = color
        container.layer.cornerRadius = 8

        let labelView = UILabel()
        labelView.text = label
        labelView.font = UIFont(name: "Inter-Medium", size: 16)
        labelView.textColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1)
        container.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false

        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        nameLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        container.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let accountLabel = UILabel()
        accountLabel.text = account
        accountLabel.font = UIFont(name: "Inter-Regular", size: 16)
        accountLabel.textColor = UIColor(red: 0.54, green: 0.53, blue: 0.56, alpha: 1)
        container.addSubview(accountLabel)
        accountLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            labelView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            labelView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),

            nameLabel.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),

            accountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            accountLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            accountLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            accountLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12)
        ])

        return container
    }
}

