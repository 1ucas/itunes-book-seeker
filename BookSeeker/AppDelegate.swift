import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: BookSeekerCoordinator?
    var window: UIWindow?
    var navigationController = UINavigationController()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        configureNavigation()

        return true
    }

//    func applicationWillEnterForeground(_ application: UIApplication) {
//        navigationController.popToRootViewController(animated: false)
//    }

    func configureNavigation() {

        coordinator = BookSeekerCoordinator()
        coordinator?.start(navigationController: navigationController)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
