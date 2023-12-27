import UIKit

//MARK: - Final class DetailCarsEndTableViewCell

final class DetailCarsEndTableViewCell: UITableViewCell {
    
    
//MARK: - Properties of class
    
    private let containerView = UIView()
    private let complaineButton = UIButton()

    
    
//MARK: - Initializators
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(containerView)
        containerView.addSubview(complaineButton)
        
        constraintes()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        complaineButton.translatesAutoresizingMaskIntoConstraints = false
        complaineButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        complaineButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        complaineButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        complaineButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.97).isActive = true
    }
    
    
    
//MARK: - Configuration UI
    
    private func configureUI() {
        
        containerView.backgroundColor = .clear
        
        complaineButton.setTitle("Пожаловаться", for: .normal)
        complaineButton.setTitleColor(.white, for: .normal)
        complaineButton.titleLabel?.textAlignment = .center
        complaineButton.backgroundColor = UIColor.systemRed
        complaineButton.layer.cornerRadius = 10
    }
}
