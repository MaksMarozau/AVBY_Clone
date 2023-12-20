import UIKit

//MARK: - Final class DetailsCarTableViewCell

final class DetailsCarTableViewCell: UITableViewCell {

//MARK: - Properties of class
    
    private let generalContainerView = UIView()
    
    private let topView = UIView()
    private let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let middleView = UIView()
    private let bottomView = UIView()
    
    private let layout = UICollectionViewFlowLayout()
    
    private let nameLable = UILabel()
    private let priceBynLable = UILabel()
    private let priceUsdLable = UILabel()
    
    private let creditButton = UIButton()
    private let bankIcon = UIImageView()
    private let buttonsStackView = UIStackView()
    private let shareButton = UIButton()
    private let commentButton = UIButton()
    private let markButton = UIButton()
    
    private let sepparatorTop = UIView()
    
    private let appierenceContainerView = UIView()
    private let cityContainerView = UIView()
    private let appieranceLable = UILabel()
    private let allParametes = UIButton()
    private let sepparatorBot = UIView()
    
    private let cityAndReDateLable = UILabel()
    private let countOfViewsButton = UIButton()
    
    
    
//MARK: - Initializators
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Add subviews
        
    private func addSubviews() {
        
      
    }
}


