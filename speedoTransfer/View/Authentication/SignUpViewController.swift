import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    let profileVc = MoreProfileVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        profileVc.firstbackgroundColor(to: self.view)
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
        fullNameTextField.tag = 1
        
        // Email Label and Text Field
        let emailLabel = createLabel(text: "Email")
        let emailTextField = createTextField(placeholder: "Enter your email address")
        emailTextField.tag = 2
        
        // Password Label and Text Field
        let passwordLabel = createLabel(text: "Password")
        let passwordTextField = createTextField(placeholder: "Enter your password", isSecure: true)
        passwordTextField.tag = 3
        
        // Confirm Password Label and Text Field
        let confirmPasswordLabel = createLabel(text: "Confirm Password")
        let confirmPasswordTextField = createTextField(placeholder: "Enter your password", isSecure: true)
        confirmPasswordTextField.tag = 4
        
        // Country Label and Text Field
        let countryLabel = createLabel(text: "Country")
        let countryTextField = createTextField(placeholder: "Enter your country")
        countryTextField.tag = 5
        
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
            confirmPasswordLabel, confirmPasswordTextField,
            countryLabel, countryTextField
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
        // Collect data from text fields using tags
        guard let fullNameTextField = view.viewWithTag(1) as? UITextField,
              let emailTextField = view.viewWithTag(2) as? UITextField,
              let passwordTextField = view.viewWithTag(3) as? UITextField,
              let confirmPasswordTextField = view.viewWithTag(4) as? UITextField,
              let countryTextField = view.viewWithTag(5) as? UITextField else {
            print("Error accessing text fields.")
            return
        }

        guard let fullName = fullNameTextField.text, !fullName.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty,
              let country = countryTextField.text, !country.isEmpty else {
            print("Please fill out all fields.")
            return
        }

        // Validate passwords match
        guard password == confirmPassword else {
            print("Passwords do not match.")
            return
        }

        // Prepare parameters for API request
        let parameters: [String: Any] = [
            "fullName": fullName,
            "email": email,
            "password": password,
            "country": country,
            "name": fullName // Assuming "name" refers to the full name
        ]

        // URL of the API endpoint
        let url = "http://speedotransfer-backend-production-7875.up.railway.app/api/v1/auth/register"

        // Make API request
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success(let responseObject):
                print("Response Object: \(responseObject)")
                // Proceed to next screen or show a success message
                let firstSignUpVC = FirstSignUpViewController()
                firstSignUpVC.modalPresentationStyle = .fullScreen
                self.present(firstSignUpVC, animated: true, completion: nil)

            case .failure(let error):
                print("Sign up failed: \(error)")
                if let data = response.data {
                    // Print or inspect response data for error details
                    let errorString = String(data: data, encoding: .utf8) ?? "Unknown error"
                    print("Error Data: \(errorString)")
                }
                // Show an alert or error message
                let alert = UIAlertController(title: "Error", message: "Sign up failed. Please try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
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
        textField.textColor = UIColor(red: 0.14, green: 0.13, blue:

0.12, alpha: 1)
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
