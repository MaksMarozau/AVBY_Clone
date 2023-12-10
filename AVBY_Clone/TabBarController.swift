import UIKit

//MARK: - Finall Class TabBarController

final class TabBarController: UITabBarController {
    
    
//MARK: - Private Properties
    
    private let carsController = CarsViewController()
    private let favoriteController = FavoritesViewController()
    private let advertisementController = AdvertisementsViewController()
    private let dialoguesController = DialoguesViewController()
    private let otherController = OtherViewController()
    


//MARK: - TabBarController's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTabBarUI()
        configItemsUI()
        addControllers()
    }
    
    
    
//MARK: - Configure UI of TabBar
    
    private func configTabBarUI() {
        
        view.backgroundColor = .backgroundMain
        UITabBar.appearance().backgroundColor = .backgroundSub
        UITabBar.appearance().tintColor = .itemSelected
        UITabBar.appearance().unselectedItemTintColor = .itemUnselected
    }
    
    
    
//MARK: - Configure UI of Items
    
    private func configItemsUI() {
        
        carsController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 0)

        favoriteController.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "bookmark.fill"), tag: 1)
        
        advertisementController.tabBarItem = UITabBarItem(title: "Объявления", image: UIImage(systemName: "rectangle.stack.badge.plus"), tag: 2)
        
        dialoguesController.tabBarItem = UITabBarItem(title: "Диалоги", image: UIImage(systemName: "ellipsis.message"), tag: 3)
        
        otherController.tabBarItem = UITabBarItem(title: "Прочее", image: UIImage(systemName: "text.justify"), tag: 4)
    }
    
    
    
//MARK: - Add controllers
            
    private func addControllers() {
        
        let carsNavigationController = UINavigationController(rootViewController: carsController)
        
        self.viewControllers = [carsNavigationController, favoriteController, advertisementController, dialoguesController, otherController]
    }
}
