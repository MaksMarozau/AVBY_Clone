import UIKit

//MARK: - Finall Class TabBarController

class TabBarController: UITabBarController {
    
    
//MARK: - Private Properties
    
    private let carsController = CarsNavigationController(rootViewController: CarsViewController())
    private let favoriteController = FavoritesViewController()
    private let advertisementController = AdvertisementsViewController()
    private let dialoguesController = DialoguesViewController()
    private let otherController = OtherViewController()
    


//MARK: - TabBarController's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [carsController, favoriteController, advertisementController, dialoguesController, otherController]
        
        configTabBarUI()
        configItemsUI()
    }
    
    
    
//MARK: - Configure UI of TabBar
    
    private func configTabBarUI() {
        
        view.backgroundColor = .backgroundMain
        tabBar.backgroundColor = .backgroundSub
        tabBar.barTintColor = .itemSelected
        tabBar.unselectedItemTintColor = .itemUnselected
        
        
        
    }
    
    
    
//MARK: - Configure UI of Items
    
    private func configItemsUI() {
        
        carsController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        favoriteController.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "bookmark.fill"), tag: 1)
        
        advertisementController.tabBarItem = UITabBarItem(title: "Объявления", image: UIImage(systemName: "rectangle.stack.badge.plus"), tag: 2)
        
        dialoguesController.tabBarItem = UITabBarItem(title: "Диалоги", image: UIImage(systemName: "ellipsis.message"), tag: 3)
        
        otherController.tabBarItem = UITabBarItem(title: "Прочее", image: UIImage(systemName: "text.justify"), tag: 4)
        
        
    }

}
