import UIKit

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1, green: 0.92, blue: 0.93, alpha: 1)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "Sign Up"
        titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Full Name Label and Text Field
        let fullNameLabel = createLabel(text: "Full Name")
        let fullNameTextField = createTextField(placeholder: "Enter your Full Name")
        
        // Email Label and Text Field
        let emailLabel = createLabel(text: "Email")
        let emailTextField = createTextField(placeholder: "Enter your email address")
        
        // Password Label and Text Field
        let passwordLabel = createLabel(text: "Password")
        let passwordTextField = createTextField(placeholder: "Enter your password", isSecure: true)
        
        // Confirm Password Label and Text Field
        let confirmPasswordLabel = createLabel(text: "Confirm password")
        let confirmPasswordTextField = createTextField(placeholder: "Enter your password", isSecure: true)
        
        // Sign Up Button
        let signUpButton = UIButton()
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1)
        signUpButton.layer.cornerRadius = 6
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        
        // Sign In Option
        let signInLabel = UILabel()
        signInLabel.text = "Already have an account?"
        signInLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        signInLabel.textColor = UIColor(red: 0.54, green: 0.53, blue: 0.53, alpha: 1)
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInLabel)
        
        let signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1), for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        view.addSubview(signInButton)
        
        // Stack View for Inputs
        let stackView = UIStackView(arrangedSubviews: [
            fullNameLabel, fullNameTextField,
            emailLabel, emailTextField,
            passwordLabel, passwordTextField,
            confirmPasswordLabel, confirmPasswordTextField
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Auto Layout Constraints
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Stack View
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            // Sign Up Button
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Sign In Label and Button
            signInLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 4),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Add Target for Sign Up Button
        signUpButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        let firstSignUpVC = FirstSignUpViewController()
        firstSignUpVC.modalPresentationStyle = .fullScreen
        present(firstSignUpVC, animated: true, completion: nil)
    }
    
    @objc func signInButtonPressed() {
        let signInVC = SignInViewController()
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true, completion: nil)
    }
    
    // Helper Function to Create Labels
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    // Helper Function to Create Text Fields
    func createTextField(placeholder: String, isSecure: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont(name: "HelveticaNeue", size: 14)
        textField.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = isSecure
        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        textField.layer.borderColor = UIColor(red: 0.69, green: 0.69, blue: 0.68, alpha: 1).cgColor
        textField.layer.borderWidth = 0.75
        textField.layer.cornerRadius = 6
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
}
