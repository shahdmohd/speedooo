import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        scheduleNotification()
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

        // Sign In Title
        let signInTitleLabel = UILabel()
        signInTitleLabel.text = "Sign In"
        signInTitleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        signInTitleLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        signInTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(signInTitleLabel)

        // Email Label and Field
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        emailLabel.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(emailLabel)

        let emailField = createTextField(placeholder: "Enter your email address")
        container.addSubview(emailField)

        // Password Label and Field
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        passwordLabel.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1.0)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(passwordLabel)

        let passwordField = createTextField(placeholder: "Enter your password")
        passwordField.isSecureTextEntry = true
        container.addSubview(passwordField)

        // Sign In Button
        let signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        signInButton.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.cornerRadius = 6
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(signInButton)

        // Sign Up Prompt
        let signUpPromptLabel = UILabel()
        signUpPromptLabel.text = "Don’t have an account?"
        signUpPromptLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        signUpPromptLabel.textColor = UIColor(red: 0.54, green: 0.53, blue: 0.53, alpha: 1.0)
        signUpPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(signUpPromptLabel)

        let signUpButton = UIButton()
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        signUpButton.setTitleColor(UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0), for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .highlighted)
        signUpButton.titleLabel?.underline()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(signUpButton)

        // Layout Constraints
        NSLayoutConstraint.activate([
            // Container Constraints
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // Sign In Title
            signInTitleLabel.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 30),
            signInTitleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),

            // Email Label
            emailLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            emailLabel.topAnchor.constraint(equalTo: signInTitleLabel.bottomAnchor, constant: 40),

            // Email Field
            emailField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailField.heightAnchor.constraint(equalToConstant: 50),

            // Password Label
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 24),

            // Password Field
            passwordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordField.heightAnchor.constraint(equalToConstant: 50),

            // Sign In Button
            signInButton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            signInButton.heightAnchor.constraint(equalToConstant: 50),

            // Sign Up Prompt Label
            signUpPromptLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            signUpPromptLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),

            // Sign Up Button
            signUpButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signUpPromptLabel.bottomAnchor, constant: 8)
        ])

        // Add Target for Buttons
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
    }

    @objc func signInButtonPressed() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
    }

    @objc func signUpButtonPressed() {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }

    func showNotification() {
        let alert = UIAlertController(title: "Notification", message: "We logged you out because you were inactive for 2 minutes - it’s to help your account secure", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func scheduleNotification() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 120) { // 120 seconds = 2 minutes
            self.showNotification()
        }
    }

    // Helper function to create text fields
    func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont(name: "HelveticaNeue", size: 14)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 0.75
        textField.layer.cornerRadius = 6
        textField.layer.borderColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1.0).cgColor
        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = view.bounds
        }
    }
}

extension UILabel {
    func underline() {
        let underline = NSAttributedString(
            string: self.text ?? "",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        self.attributedText = underline
    }
}
