import UIKit

//MARK: - Final class DetailsCarTableViewCell

final class DetailsCarMainTableViewCell: UITableViewCell {
    
    
//MARK: - Properties of class
    
    //MARK: - Properties for UI creating

    //globalView
    private let globalView = UIView()
    
    
    //struct views
    private let topView = UIView()
    private let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let middleView = UIView()
    private let sepparatorTop = UIView()
    private let descriptionView = UIView()
    private let sepparatorBot = UIView()
    private let parametresStackView = UIStackView()
    private let countOfViewsButton = UIButton()
    
    
    //struct sub views
    //topView's sub views
    private let nameLable = UILabel()
    private let priceBynLable = UILabel()
    private let priceUsdLable = UILabel()
    private let detailPriceArrowButton = UIButton()
    
    //middleView's sub views
    private let creditButton = UIButton()
    private let bankIcon = UIImageView()
    private let buttonsStackView = UIStackView()
    private let shareButton = SpecialCustomButton(titleImage: UIImage(systemName: "square.and.arrow.up"), titleText: "Поделиться")
    private let commentButton = SpecialCustomButton(titleImage: UIImage(systemName: "rectangle.portrait.badge.plus"), titleText: "Комментарий")
    private let markButton = SpecialCustomButton(titleImage: UIImage(systemName: "bookmark"), titleText: "В закладки")
    
    //descriptionView's sub views
    private let descriptionLable = UILabel()

    //parametresStackView's sub views
    private let allParametes = UIButton()
    private let optionalContantView = UIView()
    private let cityAndReDateLable = UILabel()
    //allParametres"s sub view
    private let allParametresChvron = UIImageView()
    //optionalContantView's sub views
    private let optionalStackView = UIStackView()
    private let topLable = UILabel()
    private let vinLable = UILabel()
    
    //imageCollectionView's layout
    private let layout = UICollectionViewFlowLayout()
    
    
    //MARK: - Supporting properties

    var imageArray: [UIImage] = []

    
    
//MARK: - Initializators
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .backgroundSub
        
        addSubviews()
        constraintes()
        setupFlowLayout()
        configureUI()
        
        imageCollectionView.register(DetailsCarCollectionViewCell.self, forCellWithReuseIdentifier: "DetailsCarCollectionViewCell")
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Add subviews
    
    private func addSubviews() {
        
        contentView.addSubview(globalView)
        
        globalView.addSubviews(views: topView, imageCollectionView, middleView, sepparatorTop, descriptionView, sepparatorBot, parametresStackView, countOfViewsButton)
        
        topView.addSubviews(views: nameLable, priceBynLable, priceUsdLable, detailPriceArrowButton)
        middleView.addSubviews(views: creditButton, buttonsStackView)
        creditButton.addSubview(bankIcon)
        descriptionView.addSubviews(views: descriptionLable)
        parametresStackView.addArrangedSubviews(views: allParametes, optionalContantView, cityAndReDateLable)

        buttonsStackView.addArrangedSubviews(views: shareButton, commentButton, markButton)
        allParametes.addSubview(allParametresChvron)
        optionalContantView.addSubview(optionalStackView)
        optionalStackView.addArrangedSubviews(views: topLable, vinLable)
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        //Constraintes for global container view
        globalView.translatesAutoresizingMaskIntoConstraints = false
        globalView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        globalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        globalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        globalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        //Constraintes for global's subViews
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: globalView.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        topView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 62).isActive = true
        
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor).isActive = true
        imageCollectionView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 18).isActive = true
        middleView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        middleView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        middleView.heightAnchor.constraint(equalToConstant: 165).isActive = true
        
        
        sepparatorTop.translatesAutoresizingMaskIntoConstraints = false
        sepparatorTop.topAnchor.constraint(equalTo: middleView.bottomAnchor).isActive = true
        sepparatorTop.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        sepparatorTop.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        sepparatorTop.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: sepparatorTop.topAnchor, constant: 18).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        descriptionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 33).isActive = true
        
        
        sepparatorBot.translatesAutoresizingMaskIntoConstraints = false
        sepparatorBot.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 8).isActive = true
        sepparatorBot.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10).isActive = true
        sepparatorBot.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        sepparatorBot.heightAnchor.constraint(equalToConstant: 1).isActive = true

        
        parametresStackView.translatesAutoresizingMaskIntoConstraints = false
        parametresStackView.topAnchor.constraint(equalTo: sepparatorBot.bottomAnchor, constant: 0).isActive = true
        parametresStackView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        parametresStackView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        parametresStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        
        
        countOfViewsButton.translatesAutoresizingMaskIntoConstraints = false
        countOfViewsButton.topAnchor.constraint(equalTo: parametresStackView.bottomAnchor, constant: 8).isActive = true
        countOfViewsButton.bottomAnchor.constraint(equalTo: globalView.bottomAnchor, constant: -25).isActive = true
        countOfViewsButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        countOfViewsButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.94).isActive = true
        countOfViewsButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        
        
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
        
        detailPriceArrowButton.translatesAutoresizingMaskIntoConstraints = false
        detailPriceArrowButton.centerYAnchor.constraint(equalTo: priceUsdLable.centerYAnchor).isActive = true
        detailPriceArrowButton.leadingAnchor.constraint(equalTo: priceUsdLable.trailingAnchor, constant: 5).isActive = true
        detailPriceArrowButton.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.3).isActive = true
        detailPriceArrowButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        
        //Constraintes for middleView's subViews
        creditButton.translatesAutoresizingMaskIntoConstraints = false
        creditButton.topAnchor.constraint(equalTo: middleView.topAnchor).isActive = true
        creditButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor).isActive = true
        creditButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor).isActive = true
        creditButton.heightAnchor.constraint(equalTo: middleView.heightAnchor, multiplier: 0.42).isActive = true
        
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
 
        
        //Constraintes for descriptionView's subViews
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 3).isActive = true
        descriptionLable.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        descriptionLable.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        descriptionLable.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        
        
        //Constraintes for allParametes's subViews
        allParametresChvron.translatesAutoresizingMaskIntoConstraints = false
        allParametresChvron.centerYAnchor.constraint(equalTo: allParametes.centerYAnchor).isActive = true
        allParametresChvron.trailingAnchor.constraint(equalTo: allParametes.trailingAnchor, constant: -5).isActive = true
        
        
        //Constraintes for optionalContantView's subView
        optionalStackView.translatesAutoresizingMaskIntoConstraints = false
        optionalStackView.topAnchor.constraint(equalTo: optionalContantView.topAnchor, constant: 6).isActive = true
        optionalStackView.bottomAnchor.constraint(equalTo: optionalContantView.bottomAnchor, constant: -18).isActive = true
        optionalStackView.widthAnchor.constraint(lessThanOrEqualTo: optionalContantView.widthAnchor, multiplier: 1).isActive = true
        optionalStackView.isHidden = false
        
        
        //Constraintes for optionalStackView's subView
        topLable.translatesAutoresizingMaskIntoConstraints = false
        topLable.widthAnchor.constraint(equalToConstant: 45).isActive = true
        topLable.heightAnchor.constraint(equalToConstant: 20).isActive = true
        topLable.isHidden = false

        vinLable.translatesAutoresizingMaskIntoConstraints = false
        vinLable.widthAnchor.constraint(equalToConstant: 45).isActive = true
        vinLable.heightAnchor.constraint(equalToConstant: 20).isActive = true
        vinLable.isHidden = false
    }
    
    
    
    //MARK: - Setup Layouts for imageCollectionView
        
        private func setupFlowLayout() {
            
            layout.itemSize = CGSize(width: 380, height: 240)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 1
            imageCollectionView.collectionViewLayout = layout
        }
    
    
    
//MARK: - Configure UI
        
    private func configureUI() {
        
        //globalView configure
        globalView.backgroundColor = .backgroundSub
        
        
        //globalView's subviews configure
        topView.backgroundColor = .clear
        
        imageCollectionView.backgroundColor = .clear
        
        middleView.backgroundColor = .clear
        
        sepparatorTop.backgroundColor = .separator

        parametresStackView.backgroundColor = .clear
        parametresStackView.axis = .vertical
        parametresStackView.distribution = .fillEqually
        
        sepparatorBot.backgroundColor = .separator
        
        countOfViewsButton.backgroundColor = UIColor.backgroundMain
        countOfViewsButton.setTitleColor(UIColor.dirtyBlue, for: .normal)
        countOfViewsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        countOfViewsButton.setImage(UIImage(systemName: "eye"), for: .normal)
        countOfViewsButton.tintColor = UIColor.dirtyBlue
        countOfViewsButton.layer.cornerRadius = 10
        countOfViewsButton.addTarget(self, action: #selector(tapCountOfViewsButton), for: .touchUpInside)
        
        
        //topView's subviews configure
        nameLable.textAlignment = .left
        nameLable.textColor = .fontMain
        nameLable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameLable.numberOfLines = 0

        priceBynLable.textColor = .fontMain
        priceBynLable.textAlignment = .left
        priceBynLable.font = UIFont.systemFont(ofSize: 27, weight: .black)
        
        priceUsdLable.textColor = .fontSub
        priceUsdLable.textAlignment = .right
        priceUsdLable.font = UIFont.systemFont(ofSize: 14)
        
        detailPriceArrowButton.backgroundColor = .backgroundMain
        detailPriceArrowButton.layer.cornerRadius = 10
        detailPriceArrowButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        detailPriceArrowButton.tintColor = UIColor.dirtyBlue
        
        
        //middleView's subviews configure
        creditButton.backgroundColor = .backgroundMain
        creditButton.layer.cornerRadius = 10
        creditButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        creditButton.setTitleColor(UIColor.dirtyBlue, for: .normal)
        creditButton.titleLabel?.numberOfLines = 2
        creditButton.contentHorizontalAlignment = .left
        
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10


        //descriptionView's subview configure
        descriptionLable.textColor = .fontMain
        descriptionLable.textAlignment = .left
        descriptionLable.font = UIFont.systemFont(ofSize: 17, weight: .light)
        descriptionLable.numberOfLines = 0
        

        //parametresStackView's subviews configure
        allParametes.backgroundColor = .clear
        allParametes.setTitle("Все параметры", for: .normal)
        allParametes.setTitleColor(UIColor.dirtyBlue, for: .normal)
        allParametes.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        allParametes.contentHorizontalAlignment = .left
        
        optionalContantView.backgroundColor = .clear
        
        cityAndReDateLable.backgroundColor = .clear
        cityAndReDateLable.textColor = .fontSub
        cityAndReDateLable.numberOfLines = 2
        cityAndReDateLable.font = UIFont.systemFont(ofSize: 15)
        
        optionalStackView.axis = .horizontal
        optionalStackView.distribution = .fillEqually
        optionalStackView.spacing = 5
        
        
        //creditButton's subview configure
        bankIcon.backgroundColor = .clear
        bankIcon.contentMode = .scaleAspectFill
        bankIcon.image = UIImage(named: "belveb")
        bankIcon.layer.cornerRadius = 10
        bankIcon.clipsToBounds = true
        
        
        //allParametes's subview configure
        allParametes.backgroundColor = .clear
        allParametresChvron.image = UIImage(systemName: "chevron.right")
        allParametes.tintColor = UIColor.dirtyBlue

        
        //optionalStackView's subViews configure
        topLable.backgroundColor = .top
        topLable.layer.cornerRadius = 3
        topLable.clipsToBounds = true
        let topAttachement = NSTextAttachment()
        let imageSize = CGSize(width: 10, height: 9)
        topAttachement.image = UIImage(systemName: "star.fill")
        topAttachement.bounds = CGRect(origin: .zero, size: imageSize)
        let topAttachementString = NSAttributedString(attachment: topAttachement)
        let topAttributedString = NSMutableAttributedString(string: " ТОП")
        topAttributedString.insert(topAttachementString, at: 0)
        let topParagraphStyle = NSMutableParagraphStyle()
        topParagraphStyle.alignment = .center
        topAttributedString.addAttribute(.paragraphStyle, value: topParagraphStyle, range: NSRange(location: 0, length: topAttributedString.length))
        topLable.attributedText = topAttributedString
        topLable.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
        
        
        vinLable.backgroundColor = .vin
        vinLable.layer.cornerRadius = 3
        vinLable.clipsToBounds = true
        let vinAttachement = NSTextAttachment()
        let vinImageSize = CGSize(width: 10, height: 9)
        vinAttachement.image = UIImage(systemName: "checkmark")!.withRenderingMode(.alwaysTemplate)
        vinAttachement.bounds = CGRect(origin: .zero, size: vinImageSize)
        let vinAttachementString = NSAttributedString(attachment: vinAttachement)
        let vinAttributedString = NSMutableAttributedString(string: "VIN ")
        vinAttributedString.append(vinAttachementString)
        let vinParagraphStyle = NSMutableParagraphStyle()
        vinParagraphStyle.alignment = .center
        vinAttributedString.addAttributes([.paragraphStyle: vinParagraphStyle, .foregroundColor: UIColor.white], range: NSRange(location: 0, length: vinAttributedString.length))
        vinLable.attributedText = vinAttributedString
        vinLable.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
    }
    
    
    
//MARK: - Add contant (Public method)
    
    func appedImageNamesArray(_ imageNamesArray: [String]) {
        for name in imageNamesArray {
            guard let image = UIImage(named: "\(name)") else { return }
            self.imageArray.append(image)
        }
    }
    
        
    
//MARK: - Actions
        
    @objc private func tapCountOfViewsButton() {
        
    }
    
    
    
//MARK: - Content for cell
        
    func addContent(addAdverisement advt: CarModel, _ count:Int) {
        
        nameLable.text = advt.carName.rawValue
        priceBynLable.attributedFontString(text: "\(String(advt.priceByn)) p. ", textRange: " р.", font: UIFont.systemFont(ofSize: 13, weight: .bold))
        priceUsdLable.text = " ≈ \(String(advt.convertationPricetoUsd())) $"
        creditButton.setTitle("  Лизинг \n  \(String(advt.leasing())) BYN в месяц", for: .normal)
        descriptionLable.text = "\(advt.year) г., \(advt.selector.rawValue), \(advt.engineVolume) л, \(advt.engineType.rawValue), \(advt.mileage) км, \(advt.bodyType.rawValue), \(advt.wheelsDrive.rawValue), \(advt.color)\n\n\(advt.power) л.с., расход \(advt.fuelTakes) л"
        cityAndReDateLable.text = "\(advt.city.rawValue)\nопубликовано \(advt.publicDate)"
        countOfViewsButton.setTitle(" \(count) просмотров", for: .normal)
    }
}



//MARK: - Extention of UICollectionView

extension DetailsCarMainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let image = imageArray[indexPath.item]
        
        guard let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCarCollectionViewCell", for: indexPath) as? DetailsCarCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .clear
        cell.setImage(image)
        
        return cell
    }
}

