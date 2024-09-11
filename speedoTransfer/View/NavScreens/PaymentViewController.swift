import UIKit

class PaymentViewController: UIViewController {

    // MARK: - Properties
    private let headerView = UIView()
    private let timeLabel = UILabel()
    private let indicatorView = UIView()
    private let stepperStackView = UIStackView()
    private let successMessageLabel = UILabel()
    private let fromCardView = UIView()
    private let toCardView = UIView()
    private let transferAmountView = UIView()
    private let backButton = UIButton()
    private let addToFavouriteButton = UIButton()
    private let bottomBar = UIView()
    
    private let profilevc = MoreProfileVC() // Add MoreProfileVC instance

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        profilevc.secondBackgroundColor(to: view) // Set background color
        setupNavigationBar() // Ensure navigation bar setup is called
    }
    
    private func setupNavigationBar() {
        title = "Transfer"
        
        // Navigation Bar Appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(red: 1, green: 0.92, blue: 0.93, alpha: 1.0) // Background color of the nav bar
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0),
            .font: UIFont(name: "Inter", size: 20) ?? UIFont.systemFont(ofSize: 20)
        ]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Setup View
    private func setupView() {
        view.backgroundColor = UIColor(red: 1, green: 0.97, blue: 0.90, alpha: 1.0)
        
        setupHeader()
        setupStepper()
        setupSuccessMessage()
        setupButtons()
        setupBottomBar()
    }
    
    private func setupHeader() {
        headerView.backgroundColor = .white
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        timeLabel.text = "9:41"
        timeLabel.font = UIFont(name: "SF Pro", size: 17)
        timeLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        indicatorView.backgroundColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 0.35)
        indicatorView.layer.cornerRadius = 4.30
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(timeLabel)
        headerView.addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 18.34),
            timeLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16.55),
            
            indicatorView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 23),
            indicatorView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16.74),
            indicatorView.widthAnchor.constraint(equalToConstant: 25),
            indicatorView.heightAnchor.constraint(equalToConstant: 13)
        ])
    }
    
    private func setupStepper() {
        view.addSubview(stepperStackView)
        stepperStackView.axis = .horizontal
        stepperStackView.spacing = 8
        stepperStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let step1 = createStepperStep(number: "01")
        let step2 = createStepperStep(number: "02")
        let step3 = createStepperStep(number: "03")
        
        stepperStackView.addArrangedSubview(step1)
        stepperStackView.addArrangedSubview(createLine(length: 85))
        stepperStackView.addArrangedSubview(step2)
        stepperStackView.addArrangedSubview(createLine(length: 83))
        stepperStackView.addArrangedSubview(step3)
        
        NSLayoutConstraint.activate([
            stepperStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepperStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20)
        ])
    }
    
    private func createStepperStep(number: String) -> UIView {
        let stepView = UIView()
        let circle = UIView()
        circle.backgroundColor = .white
        circle.layer.borderColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0).cgColor
        circle.layer.borderWidth = 1.12
        circle.layer.cornerRadius = 35.77 / 2
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = number
        label.font = UIFont(name: "Poppins", size: 20)
        label.textColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        stepView.addSubview(circle)
        stepView.addSubview(label)
        
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: stepView.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: stepView.centerYAnchor),
            circle.widthAnchor.constraint(equalToConstant: 35.77),
            circle.heightAnchor.constraint(equalToConstant: 35.77),
            
            label.centerXAnchor.constraint(equalTo: stepView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: stepView.centerYAnchor)
        ])
        
        return stepView
    }
    
    private func createLine(length: CGFloat) -> UIView {
        let line = UIView()
        line.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        line.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line.widthAnchor.constraint(equalToConstant: length),
            line.heightAnchor.constraint(equalToConstant: 1.49)
        ])
        return line
    }
    
    private func setupSuccessMessage() {
        view.addSubview(successMessageLabel)
        successMessageLabel.text = "Your transfer was successful"
        successMessageLabel.font = UIFont(name: "Inter", size: 20)
        successMessageLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        successMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup successMessageLabel constraints
        NSLayoutConstraint.activate([
            successMessageLabel.topAnchor.constraint(equalTo: stepperStackView.bottomAnchor, constant: 20),
            successMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Further views like fromCardView, toCardView and transferAmountView should be set up similarly
    }
    
    private func setupButtons() {
        // Setup backButton
        backButton.setTitle("Back to Home", for: .normal)
        backButton.titleLabel?.font = UIFont(name: "Inter", size: 16)
        backButton.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        backButton.layer.cornerRadius = 6
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        // Setup addToFavouriteButton
        addToFavouriteButton.setTitle("Add to Favourite", for: .normal)
        addToFavouriteButton.titleLabel?.font = UIFont(name: "Inter", size: 16)
        addToFavouriteButton.layer.borderColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0).cgColor
        addToFavouriteButton.layer.borderWidth = 0.75
        addToFavouriteButton.layer.cornerRadius = 6
        addToFavouriteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addToFavouriteButton)
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backButton.heightAnchor.constraint(equalToConstant: 56),
            
            addToFavouriteButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -16),
            addToFavouriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addToFavouriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addToFavouriteButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
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
