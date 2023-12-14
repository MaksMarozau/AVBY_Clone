import UIKit.UIStackView

//MARK: - Add subViews to StackView

extension UIStackView {
    
    func addArrangedSubviews(views view: UIView...) {
        view.forEach({ addArrangedSubview($0) })
    }
}
