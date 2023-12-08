import UIKit.UINavigationController

extension UINavigationController {
    
    func setupNavBarColors(_ backgroundColor: UIColor, _ tintColor: UIColor, _ foregroundColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : foregroundColor]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : foregroundColor]
        
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        
//        self.navigationBar.tintColor = .black
        UIBarButtonItem.appearance().tintColor = tintColor
    }
}
