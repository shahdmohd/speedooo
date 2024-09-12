import UIKit

class EditProfileViewController: UIViewController {

    // Helper function to create a font with weight
    private func customFont(name: String, size: CGFloat, weight: UIFont.Weight) -> UIFont? {
        let fontDescriptor = UIFontDescriptor(fontAttributes: [
            UIFontDescriptor.AttributeName.family: name,
            UIFontDescriptor.AttributeName.traits: [
                UIFontDescriptor.TraitKey.weight: weight
            ]
        ])
        return UIFont(descriptor: fontDescriptor, size: size)
    }

    // Title Label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.font = customFont(name: "Inter", size: 20, weight: .medium)
        label.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1)
        return label
    }()

    // Save Button
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = customFont(name: "Inter", size: 16, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1)
        button.layer.cornerRadius = 6
        return button
    }()

    // Stack View for Form Fields
    private let formStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .leading
        return stackView
    }()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor(red: 1, green: 0.97, blue: 0.90, alpha: 1)
        
        // Setup Navigation Bar
        navigationItem.titleView = titleLabel

        // Add Form Fields
        let fullNameField = createTextField(placeholder: "Enter Cardholder Name", labelText: "Full Name")
        let emailField = createTextField(placeholder: "Enter Cardholder Name", labelText: "Email")
        let countryField = createTextField(placeholder: "Egypt", labelText: "Country", withArrow: true)
        let dateOfBirthField = createTextField(placeholder: "12/02/2000", labelText: "Date Of Birth")

        formStackView.addArrangedSubview(fullNameField)
        formStackView.addArrangedSubview(emailField)
        formStackView.addArrangedSubview(countryField)
        formStackView.addArrangedSubview(dateOfBirthField)

        view.addSubview(formStackView)
        view.addSubview(saveButton)

        // Constraints
        formStackView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            formStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            formStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            formStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            saveButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 24),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func createTextField(placeholder: String, labelText: String, withArrow: Bool = false) -> UIView {
        let containerView = UIView()
        
        let label = UILabel()
        label.text = labelText
        label.font = customFont(name: "Inter", size: 16, weight: .regular)
        label.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1)

        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = customFont(name: "Inter", size: 14, weight: .regular)
        textField.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)

        containerView.addSubview(label)
        containerView.addSubview(textField)
        
        if withArrow {
            let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.down"))
            arrowImageView.tintColor = UIColor(red: 0.24, green: 0.23, blue: 0.22, alpha: 1)
            containerView.addSubview(arrowImageView)
            
            arrowImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                arrowImageView.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -8),
                arrowImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
            ])
        }
        
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: containerView.topAnchor),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        return containerView
    }
}
