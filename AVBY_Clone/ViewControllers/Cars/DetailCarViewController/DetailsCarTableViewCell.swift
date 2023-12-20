import UIKit

//MARK: - Final class DetailsCarTableViewCell

final class DetailsCarTableViewCell: UITableViewCell {
    
    //MARK: - Properties of class
    
    private let globalView = UIView()
    
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
    
    private let descriptionView = UIView()
    private let descriptionLable = UILabel()

    private let allParametes = UIButton()
    private let sepparatorBot = UIView()
    
    private let cityAndReDateLable = UILabel()
    private let countOfViewsButton = UIButton()
    
    
    
    //MARK: - Initializators
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubviews()
        constraintes()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Add subviews
    
    private func addSubviews() {
        
        contentView.addSubview(globalView)
        globalView.addSubviews(views: topView, imageCollectionView, middleView, sepparatorTop, descriptionView, sepparatorBot, bottomView)
        topView.addSubviews(views: nameLable, priceBynLable, priceUsdLable)
        middleView.addSubviews(views: creditButton, buttonsStackView)
        creditButton.addSubview(bankIcon)
        buttonsStackView.addArrangedSubview(shareButton)
        buttonsStackView.addArrangedSubview(commentButton)
        buttonsStackView.addArrangedSubview(markButton)
        descriptionView.addSubviews(views: descriptionLable)
        bottomView.addSubviews(views: allParametes, cityAndReDateLable)
//        countOfViewsButton
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        //Constraintes for global container view
        globalView.translatesAutoresizingMaskIntoConstraints = false
        globalView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        globalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        globalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        globalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        //Constraintes for global's subViews
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: globalView.topAnchor, constant: 10).isActive = true
        topView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        topView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 5).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: 0).isActive = true
        imageCollectionView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 10).isActive = true
        middleView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        middleView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        middleView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        sepparatorTop.translatesAutoresizingMaskIntoConstraints = false
        sepparatorTop.topAnchor.constraint(equalTo: middleView.bottomAnchor).isActive = true
        sepparatorTop.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        sepparatorTop.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        sepparatorTop.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: sepparatorTop.topAnchor, constant: 10).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        descriptionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 33).isActive = true
        
        
        sepparatorBot.translatesAutoresizingMaskIntoConstraints = false
        sepparatorBot.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 5).isActive = true
        sepparatorBot.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        sepparatorBot.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        sepparatorBot.heightAnchor.constraint(equalToConstant: 1).isActive = true

        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: sepparatorBot.bottomAnchor, constant: 10).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: globalView.bottomAnchor, constant: -30).isActive = true
        
        
        //Constraintes for topView's subViews
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        nameLable.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        nameLable.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        nameLable.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        priceBynLable.translatesAutoresizingMaskIntoConstraints = false
        priceBynLable.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        priceBynLable.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        priceBynLable.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        priceBynLable.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        priceUsdLable.translatesAutoresizingMaskIntoConstraints = false
        priceUsdLable.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        priceUsdLable.leadingAnchor.constraint(equalTo: priceBynLable.trailingAnchor).isActive = true
        priceUsdLable.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        
        
        //
        creditButton.translatesAutoresizingMaskIntoConstraints = false
        creditButton.topAnchor.constraint(equalTo: middleView.topAnchor).isActive = true
        creditButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor).isActive = true
        creditButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor).isActive = true
        creditButton.heightAnchor.constraint(equalTo: middleView.heightAnchor, multiplier: 0.45).isActive = true
        
        
        bankIcon.translatesAutoresizingMaskIntoConstraints = false
        bankIcon.topAnchor.constraint(equalTo: creditButton.topAnchor, constant: 7).isActive = true
        bankIcon.bottomAnchor.constraint(equalTo: creditButton.bottomAnchor, constant: -7).isActive = true
        bankIcon.trailingAnchor.constraint(equalTo: creditButton.trailingAnchor, constant: -10).isActive = true
        bankIcon.widthAnchor.constraint(equalTo: creditButton.widthAnchor, multiplier: 0.25).isActive = true
        
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: creditButton.bottomAnchor).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: middleView.bottomAnchor).isActive = true
        
        
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        descriptionLable.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        descriptionLable.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true

        
        allParametes.translatesAutoresizingMaskIntoConstraints = false
        allParametes.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10).isActive = true
        allParametes.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
        allParametes.widthAnchor.constraint(equalToConstant: 130).isActive = true
        allParametes.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -5).isActive = true
        
        
        cityAndReDateLable.translatesAutoresizingMaskIntoConstraints = false
        cityAndReDateLable.topAnchor.constraint(equalTo: allParametes.topAnchor, constant: 10).isActive = true
        cityAndReDateLable.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -5).isActive = true
        cityAndReDateLable.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
        cityAndReDateLable.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
        
        
//        countOfViewsButton.translatesAutoresizingMaskIntoConstraints = false
//        countOfViewsButton.bottomAnchor.constraint(equalTo: cityContainerView.bottomAnchor).isActive = true
//        countOfViewsButton.leadingAnchor.constraint(equalTo: cityContainerView.leadingAnchor).isActive = true
//        countOfViewsButton.trailingAnchor.constraint(equalTo: cityContainerView.trailingAnchor).isActive = true
//        countOfViewsButton.heightAnchor.constraint(equalTo: cityContainerView.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    
    
//MARK: - Configure UI
        
    private func configureUI() {
        
        //globalView configure
        globalView.backgroundColor = .backgroundSub
        
        
        //globalView's subviews configure
        topView.backgroundColor = .clear
        imageCollectionView.backgroundColor = .clear
        middleView.backgroundColor = .clear
        bottomView.backgroundColor = .clear
        sepparatorTop.backgroundColor = .separator
        sepparatorBot.backgroundColor = .separator
        
        
        //topView's subviews configure
        nameLable.textAlignment = .left
        nameLable.textColor = .fontMain
        nameLable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameLable.numberOfLines = 0

        priceBynLable.textColor = .fontMain
        priceBynLable.textAlignment = .left
        priceBynLable.font = UIFont.systemFont(ofSize: 23, weight: .black)
        
        priceUsdLable.textColor = .fontSub
        priceUsdLable.textAlignment = .right
        priceUsdLable.font = UIFont.systemFont(ofSize: 14)
        
        
        //middleView's subviews configure
        creditButton.backgroundColor = .backgroundMain
        creditButton.layer.cornerRadius = 10
        creditButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        creditButton.subtitleLabel?.font = UIFont.systemFont(ofSize: 15)
        creditButton.setTitleColor(UIColor.credit, for: .normal)
        creditButton.titleLabel?.numberOfLines = 2
        creditButton.contentHorizontalAlignment = .left
        
        
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10


        //creditButton's subview configure
        bankIcon.backgroundColor = .clear
        bankIcon.contentMode = .scaleToFill
        bankIcon.image = UIImage(named: "belveb")
        bankIcon.layer.cornerRadius = 10
        bankIcon.clipsToBounds = true
        
        
        //buttonsStackView's subview configure
        shareButton.setTitle("Поделиться\nпирожком", for: .normal)
        shareButton.setTitleColor(UIColor.credit, for: .normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        shareButton.titleLabel?.numberOfLines = 2
        shareButton.titleLabel?.textAlignment = .center
//        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
//        shareButton.tintColor = UIColor.credit
//        var configShare = UIButton.Configuration.plain()
//        configShare.imagePlacement = .top
//        configShare.imagePadding = 5
//        shareButton.configuration = configShare
        

        
        commentButton.setTitle("Комментарий", for: .normal)
        commentButton.setTitleColor(UIColor.credit, for: .normal)
        commentButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        commentButton.setImage(UIImage(systemName: "rectangle.portrait.badge.plus"), for: .normal)
        commentButton.tintColor = UIColor.credit
        var configComment = UIButton.Configuration.plain()
        configComment.imagePlacement = .top
        configComment.imagePadding = 5
        commentButton.configuration = configComment
        
        markButton.setTitle("В закладки", for: .normal)
        markButton.setTitleColor(UIColor.credit, for: .normal)
        markButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        markButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        markButton.tintColor = UIColor.credit
        var configMark = UIButton.Configuration.plain()
        configMark.imagePlacement = .top
        configMark.imagePadding = 5
        markButton.configuration = configMark
        
        
        //descriptionView's subview configure
        descriptionLable.textColor = .fontMain
        descriptionLable.textAlignment = .left
        descriptionLable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        descriptionLable.numberOfLines = 0
        
        //bottomView's subviews configure
        allParametes.setTitle("All parameters", for: .normal)
        allParametes.setTitleColor(UIColor.credit, for: .normal)
        allParametes.backgroundColor = .clear
        allParametes.contentHorizontalAlignment = .left
        
        cityAndReDateLable.textColor = .fontSub
        cityAndReDateLable.numberOfLines = 2
        cityAndReDateLable.font = UIFont.systemFont(ofSize: 13)
        
      
//        countOfViewsButton.backgroundColor = #colorLiteral(red: 0.1912618577, green: 0.1962420642, blue: 0.2175750434, alpha: 1)
//        countOfViewsButton.layer.cornerRadius = 10
//        countOfViewsButton.setTitleColor(#colorLiteral(red: 0.3760706782, green: 0.6299359202, blue: 0.8252221346, alpha: 1), for: .normal)
//        countOfViewsButton.setImage(UIImage(systemName: "eye"), for: .normal)
//        countOfViewsButton.tintColor = #colorLiteral(red: 0.3760706782, green: 0.6299359202, blue: 0.8252221346, alpha: 1)
//        countOfViewsButton.addTarget(self, action: #selector(tapCountOfViewsButton), for: .touchUpInside)
    }
    
    
//MARK: - Actions
        
    @objc private func tapCountOfViewsButton() {
        
    }
    
    
    
//MARK: - Content for cell
        
    func addContent(addAdverisement advt: CarModel, _ count:Int) {
        
        nameLable.text = advt.carName.rawValue
        let attributedString = NSMutableAttributedString(string:"\(String(advt.priceByn))   byn")
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24, weight: .heavy), range: NSRange(location: 0, length: 8))
        priceBynLable.attributedText = attributedString
        priceUsdLable.text = "~\(String(advt.convertationPricetoUsd())) $"
        creditButton.setTitle("  Credit \n  from \(String(advt.leasing())) byn/mouth", for: .normal)
        descriptionLable.text = "\(advt.year) y., \(advt.selector), \(advt.engineVolume), \(advt.engineType), \(advt.mileage) km., \(advt.bodyType), \(advt.wheelsDrive)-wheels drive, \(advt.color) color\n\n\(advt.power) h.p., take \(advt.fuelTakes) l/100km"
        cityAndReDateLable.text = "\(advt.city) \nPublished: \(advt.publicDate), Up: \(advt.reloadDate)"
        countOfViewsButton.setTitle(" \(count) views", for: .normal)
    }
}


