import UIKit

class TabBarVC: UITabBarController {

    let homeNavigation = UINavigationController()
    let transferNavigation = UINavigationController()
    let transactionsNavigation = UINavigationController()
    let my_cardsNavigation = UINavigationController()
    let moreNavigation = UINavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarView()
        setViewControllers()
    }
}

extension TabBarVC {
    private func setupTabBarView() {
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 40
        tabBar.layer.shadowOffset = CGSize(width: 10, height: 10)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }

    private func homeVC() {
        let homevc = HomeViewController.create()
        homevc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal))
        
        homeNavigation.viewControllers = [homevc]
    }

    private func transferVC() {
        let transfervc = TransferViewController.create()
        transfervc.tabBarItem = UITabBarItem(title: "Transfer", image: UIImage(named: "Ecommerce-transfer money-buy-smartphone-hands"), selectedImage: UIImage(named: "Ecommerce-transfer money-buy-smartphone-hands")?.withRenderingMode(.alwaysOriginal))
        transferNavigation.viewControllers = [transfervc]
    }
    
    private func transactionsVC() {
        let transactionvc = TransactionsVC.create()
        
        transactionvc.tabBarItem = UITabBarItem(title: "Transactions", image: UIImage(named: "History 1"), selectedImage: UIImage(named: "History 1")?.withRenderingMode(.alwaysOriginal))
        
        transactionsNavigation.viewControllers = [transactionvc]
    }

    private func my_cardsVC() {
        let mycardvc = My_cardsVC.create()
        
        mycardvc.tabBarItem = UITabBarItem(title: "My cards", image: UIImage(named: "Cards 1"), selectedImage: UIImage(named: "Cards 1")?.withRenderingMode(.alwaysOriginal))
    
        my_cardsNavigation.viewControllers = [mycardvc]
    }
    
    private func moreVC() {
        let morevc = MoreVC.create()
        morevc.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "More"), selectedImage: UIImage(named: "More")?.withRenderingMode(.alwaysOriginal))
        
        moreNavigation.viewControllers = [morevc]
    }

    

    
  

    private func setViewControllers() {
        homeVC()
        transferVC()
        transactionsVC()
        my_cardsVC()
        moreVC()
        self.viewControllers = [homeNavigation, transferNavigation, transactionsNavigation, my_cardsNavigation, moreNavigation]
        self.selectedIndex = 0
        for vc in self.viewControllers! {
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
    }
}

extension TabBarVC {
    // This method is called when a tab is selected
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Check if the selected view controller is a UINavigationController
        if let navController = viewController as? UINavigationController {
            // Pop back to the root view controller
            navController.popToRootViewController(animated: false)
        }
    }
}
