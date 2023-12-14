import UIKit.UIView

//MARK: - Add subViews to View

extension UIView {
    
    func addSubviews(views view: UIView...) {
        view.forEach({ addSubview($0) })
    }
}
