import UIKit.UIButton


final class SpetialCustomButton: UIButton {
    
    let titleImage: UIImage?
    let titleText: String?
    
    init(titleImage: UIImage?, titleText: String?) {
        self.titleImage = titleImage
        self.titleText = titleText
        super.init(frame: .zero)
        setAttributedTitle(setAttributes(), for: .normal)
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setAttributes() -> NSMutableAttributedString {
        
        if let image = titleImage, let text = titleText {
            
            let attachment = NSTextAttachment()
            let setImage = image.withRenderingMode(.alwaysTemplate)
            let size = CGSize(width: 20, height: 25)
            attachment.image = setImage
            attachment.bounds = CGRect(origin: .zero, size: size)
            let attachmentString = NSAttributedString(attachment: attachment)
            let attributedString = NSMutableAttributedString(string: "\n\(text)")
            attributedString.insert(attachmentString, at: 0)
            
            attributedString.addAttributes([.foregroundColor : UIColor.credit, .font : UIFont.systemFont(ofSize: 14)], range: NSRange(location: 0, length: attributedString.length))
            
            return attributedString
        }
        else {
            let emptyString = " "
            let attributedString = NSMutableAttributedString(string: emptyString)
            return attributedString
        }
    }
}
