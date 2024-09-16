import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize the window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Check login state using UserDefaults (or any other session management)
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if isLoggedIn {
            // User is logged in, show the main screen or dashboard
            let mainVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            window?.rootViewController = UINavigationController(rootViewController: mainVC)
        } else {
            // User is not logged in, show the SignInViewController
            let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            window?.rootViewController = UINavigationController(rootViewController: signInVC)
        }
        
        // Make the window visible
        window?.makeKeyAndVisible()
        
        return true
    }
}
