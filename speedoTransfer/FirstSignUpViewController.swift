import UIKit

class FirstSignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        // Main Container
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)

        // Background Gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor(red: 1.0, green: 0.92, blue: 0.93, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)

        // "Welcome to Banque Misr!" Label
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to Banque Misr!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        welcomeLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(welcomeLabel)

        // "Let's Complete Your Profile" Label
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Let’s Complete Your Profile"
        subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(subtitleLabel)

        // Country Label and Field
        let countryLabel = UILabel()
        countryLabel.text = "Country"
        countryLabel.font = UIFont.systemFont(ofSize: 16)
        countryLabel.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(countryLabel)

        let countryField = createTextField(placeholder: "Select your country")
        container.addSubview(countryField)

        // Date of Birth Label and Field
        let dobLabel = UILabel()
        dobLabel.text = "Date Of Birth"
        dobLabel.font = UIFont.systemFont(ofSize: 16)
        dobLabel.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        dobLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(dobLabel)

        let dobField = createTextField(placeholder: "DD/MM/YYYY")
        container.addSubview(dobField)

        // Continue Button
        let continueButton = UIButton()
        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        continueButton.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 6
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        container.addSubview(continueButton)

        // "Already have an account?" Label and "Sign In" Button
        let alreadyAccountLabel = UILabel()
        alreadyAccountLabel.text = "Already have an account?"
        alreadyAccountLabel.font = UIFont.systemFont(ofSize: 16)
        alreadyAccountLabel.textColor = UIColor(red: 0.54, green: 0.53, blue: 0.53, alpha: 1.0)
        alreadyAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(alreadyAccountLabel)

        let signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0), for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        container.addSubview(signInButton)

        // Layout Constraints
        NSLayoutConstraint.activate([
            // Container Constraints
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // Welcome Label
            welcomeLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 150),

            // Subtitle Label
            subtitleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),

            // Country Label
            countryLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            countryLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 32),

            // Country Field
            countryField.leadingAnchor.constraint(equalTo: countryLabel.leadingAnchor),
            countryField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            countryField.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 8),
            countryField.heightAnchor.constraint(equalToConstant: 50),

            // Date of Birth Label
            dobLabel.leadingAnchor.constraint(equalTo: countryLabel.leadingAnchor),
            dobLabel.topAnchor.constraint(equalTo: countryField.bottomAnchor, constant: 24),

            // Date of Birth Field
            dobField.leadingAnchor.constraint(equalTo: countryField.leadingAnchor),
            dobField.trailingAnchor.constraint(equalTo: countryField.trailingAnchor),
            dobField.topAnchor.constraint(equalTo: dobLabel.bottomAnchor, constant: 8),
            dobField.heightAnchor.constraint(equalToConstant: 50),

            // Continue Button
            continueButton.leadingAnchor.constraint(equalTo: dobField.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: dobField.trailingAnchor),
            continueButton.topAnchor.constraint(equalTo: dobField.bottomAnchor, constant: 32),
            continueButton.heightAnchor.constraint(equalToConstant: 50),

            // Already have an account label
            alreadyAccountLabel.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 16),
            alreadyAccountLabel.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor),

            // Sign In Button
            signInButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: alreadyAccountLabel.bottomAnchor, constant: 4),
            signInButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            signInButton.widthAnchor.constraint(equalToConstant: 200),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func continueButtonPressed() {
        // Handle continue action here and transition to SignInViewController
        let signInVC = SignInViewController()
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true, completion: nil)
    }

    @objc func signInButtonPressed() {
        let signInVC = SignInViewController()
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true, completion: nil)
    }

    // Helper function to create text fields
    func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 0.75
        textField.layer.cornerRadius = 6
        textField.layer.borderColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0).cgColor
        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
}
