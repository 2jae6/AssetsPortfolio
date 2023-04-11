import UIKit
import CoreData
import AssetsPortfolioKit
import AssetsPortfolioUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "AssetsCoreData")
      container.loadPersistentStores { description, error in
          if let error = error {
              fatalError("Unable to load persistent stores: \(error)")
          }
      }
      return container
  }()

  func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let viewController = MainViewController()
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()

    return true
  }

}
