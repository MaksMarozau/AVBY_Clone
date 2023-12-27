import UIKit

//MARK: - Final class DetailsCarAdditionalTableViewCell

final class DetailsCarAdditionalTableViewCell: UITableViewCell {

    
//MARK: - Properties of class
    
    private let containerView = UIView()
    private let titleLable = UILabel()
    private let descriptionLable = UILabel()
    
    
    
//MARK: - Initializators
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        contentView.addSubview(containerView)
        containerView.addSubviews(views: titleLable, descriptionLable)
        
        constraintes()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        titleLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        titleLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 12).isActive = true
        descriptionLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        descriptionLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        descriptionLable.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12).isActive = true
        descriptionLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
    }
    
    
    
//MARK: - Configure UI
    
    private func configureUI() {
        
        containerView.backgroundColor = .backgroundSub
        
        titleLable.backgroundColor = .clear
        titleLable.textColor = .fontMain
        titleLable.textAlignment = .left
        titleLable.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        descriptionLable.backgroundColor = .clear
        descriptionLable.textColor = .fontMain
        descriptionLable.textAlignment = .left
        descriptionLable.font = UIFont.systemFont(ofSize: 18)
        descriptionLable.numberOfLines = 0
    }
    
   
    
//MARK: - Add content
    
    func setTitleText(_ text: String) {
        titleLable.text = text
    }
    
    
    func setDescriptionText(_ text: String) {
        descriptionLable.text = text
    }
}
