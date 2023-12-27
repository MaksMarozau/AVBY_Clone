import UIKit.UILabel

//MARK: - Make attributed string for label with necesseary parametres

extension UILabel {
    
    func attributedFontString(text: String, textRange: String, font: UIFont) {
        
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: textRange)
        attributedString.addAttribute(.font, value: font, range: range)
        attributedText = attributedString
    }
}
