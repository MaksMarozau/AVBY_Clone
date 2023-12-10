import UIKit

//MARK: - Final class CarsCollectionViewCell

final class CarsCollectionViewCell: UICollectionViewCell {
    
    
//MARK: - Properties
    

    private let imageView = UIImageView()
    
    
    
//MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        constraintes()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    
    
//MARK: - ConfigureUI
    
    private func configUI() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleToFill
    }
    
    
    
//MARK: - Set Image (public method)
        
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
