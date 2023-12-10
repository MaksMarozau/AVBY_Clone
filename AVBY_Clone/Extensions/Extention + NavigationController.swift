import UIKit.UINavigationController

//MARK: - Make a custom color scheme for navigationBar for local useing
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
        
        UIBarButtonItem.appearance().tintColor = tintColor
    }
}
