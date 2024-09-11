import UIKit

class FavoritesListViewController: UIViewController {
    
    private let favorites = ["Favorite 1", "Favorite 2"]
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        preferredContentSize = CGSize(width: 375, height: 400) // Adjust the height as needed for half-screen
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Favorites"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = CGSize(width: 375, height: 400)
    }
}

extension FavoritesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = favorites[indexPath.row]
        return cell
    }
}

// HalfScreenPresentationController to control the half-screen size
class HalfScreenPresentationController: UIPresentationController {

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        
        // Set the height to half of the container view's height
        let height: CGFloat = containerView.bounds.height / 2
        let size = CGSize(width: containerView.bounds.width, height: height)
        let origin = CGPoint(x: 0, y: containerView.bounds.height - height)
        
        return CGRect(origin: origin, size: size)
    }

    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
}

// Presenting ViewController
class YourPresentingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // Action to present FavoritesListViewController modally
    @IBAction func presentFavorites() {
        let favoritesVC = FavoritesListViewController()
        favoritesVC.modalPresentationStyle = .custom
        favoritesVC.transitioningDelegate = self // Assign the custom transition delegate
        present(favoritesVC, animated: true, completion: nil)
    }
}

// Conform to UIViewControllerTransitioningDelegate to use custom presentation
extension YourPresentingViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfScreenPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
