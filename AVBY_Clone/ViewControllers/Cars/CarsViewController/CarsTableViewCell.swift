import UIKit

//MARK: - Protocol CarsTableViewCellDelegate

protocol CarsTableViewCellDelegate: AnyObject {
    
    func hidden()
    func mark()
    func leasing()
    func ImageItem(_ indexPathRow: Int)
}



//MARK: - Final classCarsTableViewCell

final class CarsTableViewCell: UITableViewCell {
    
    
//MARK: - Properties
    
    //MARK: - Properties for UI creating
    
    //global view
    private let globalView = UIView()
    
    
    //struct views
    private let nameView = UIView()
    private let priceView = UIView()
    private var imageCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let descriptionStackView = UIStackView()
    private let sepparator = UIView()
    private let creditView = UIView()
    
    
    //struct sub views
    let nameCarLable = UILabel()
    private let hideButton = UIButton()
    private let markButton = UIButton()
    
    let priceLable = UILabel()
    let convertPriceLable = UILabel()
    
    let descriptionLable = UILabel()
    let optionalContantView = UIView()
    let dateLable = UILabel()
    //optionalContantView's subViews
    let optionalViewsStackView = UIStackView()
    let topLable = UILabel()
    let vinLable = UILabel()
    
    private let leasingButton = UIButton()
    let mounthlySumLabel = UILabel()
    
    //imageCollectionView's layout
    private let layout = UICollectionViewFlowLayout()
    
    
    //MARK: - Supporting properties
    
    var imageArray: [UIImage] = []
    weak var delegate: CarsTableViewCellDelegate?

    //    var countOfView = 0
    //    var index = 0
    
    
    
//MARK: - Initializations for cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        constraintes()
        setupFlowLayout()
        configureUI()
        addTargets()
        
        imageCollectionView.register(CarsCollectionViewCell.self, forCellWithReuseIdentifier: "CarsCollectionViewCell")
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Add views
    
    private func addViews() {
        
        contentView.addSubview(globalView)
        
        globalView.addSubviews(views: nameView, priceView, imageCollectionView, descriptionStackView, sepparator, creditView)
        
        nameView.addSubviews(views: nameCarLable, hideButton, markButton)
        
        priceView.addSubviews(views: priceLable, convertPriceLable)
        
        descriptionStackView.addArrangedSubviews(views: descriptionLable, optionalContantView, dateLable)
        optionalContantView.addSubview(optionalViewsStackView)
        optionalViewsStackView.addArrangedSubviews(views: topLable, vinLable)
        
        creditView.addSubviews(views: leasingButton, mounthlySumLabel)
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        //Constraintes for global container view
        globalView.translatesAutoresizingMaskIntoConstraints = false
        globalView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        globalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        globalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        globalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        
        //Constraintes for global's subViews
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: globalView.topAnchor, constant: 10).isActive = true
        nameView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        nameView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        nameView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.topAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        priceView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        priceView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        priceView.heightAnchor.constraint(greaterThanOrEqualToConstant: 35).isActive = true
        priceView.widthAnchor.constraint(equalTo: globalView.widthAnchor, multiplier: 0.55).isActive = true
        
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 5).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: 0).isActive = true
        imageCollectionView.heightAnchor.constraint(equalToConstant: 242).isActive = true
        
        
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 5).isActive = true
        descriptionStackView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        descriptionStackView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        descriptionStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
        
        sepparator.translatesAutoresizingMaskIntoConstraints = false
        sepparator.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor).isActive = true
        sepparator.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        sepparator.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        sepparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        creditView.translatesAutoresizingMaskIntoConstraints = false
        creditView.topAnchor.constraint(equalTo: sepparator.bottomAnchor).isActive = true
        creditView.bottomAnchor.constraint(equalTo: globalView.bottomAnchor).isActive = true
        creditView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        creditView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -8).isActive = true
        creditView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        //Constraintes for nameView's subViews
        markButton.translatesAutoresizingMaskIntoConstraints = false
        markButton.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 1).isActive = true
        markButton.trailingAnchor.constraint(equalTo: nameView.trailingAnchor).isActive = true
        markButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.10).isActive = true
        
        
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.trailingAnchor.constraint(equalTo: markButton.leadingAnchor).isActive = true
        hideButton.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 1).isActive = true
        hideButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.10).isActive = true
        hideButton.isHidden = true
        
        
        nameCarLable.translatesAutoresizingMaskIntoConstraints = false
        nameCarLable.topAnchor.constraint(equalTo: nameView.topAnchor).isActive = true
        nameCarLable.bottomAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        nameCarLable.leadingAnchor.constraint(equalTo: nameView.leadingAnchor).isActive = true
        nameCarLable.trailingAnchor.constraint(equalTo: hideButton.leadingAnchor).isActive = true
        
        
        //Constraintes for priceView's subViews
        priceLable.translatesAutoresizingMaskIntoConstraints = false
        priceLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
        priceLable.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
        
        convertPriceLable.translatesAutoresizingMaskIntoConstraints = false
        convertPriceLable.leadingAnchor.constraint(equalTo: priceLable.trailingAnchor).isActive = true
        convertPriceLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
        
        
        //Constraintes for descriptionStackView's subViews
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 33).isActive = true
        
        
        optionalContantView.translatesAutoresizingMaskIntoConstraints = false
        optionalContantView.heightAnchor.constraint(equalToConstant: 33).isActive = true
        optionalContantView.isHidden = true
        
        
        dateLable.translatesAutoresizingMaskIntoConstraints = false
        dateLable.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        
        //Constraintes for optionalContantView's subViews
        optionalViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        optionalViewsStackView.topAnchor.constraint(equalTo: optionalContantView.topAnchor, constant: 6).isActive = true
        optionalViewsStackView.bottomAnchor.constraint(equalTo: optionalContantView.bottomAnchor, constant: -6).isActive = true
        optionalViewsStackView.widthAnchor.constraint(lessThanOrEqualTo: optionalContantView.widthAnchor, multiplier: 1).isActive = true
        optionalViewsStackView.isHidden = true
        
        
        topLable.translatesAutoresizingMaskIntoConstraints = false
        topLable.widthAnchor.constraint(equalToConstant: 45).isActive = true
        topLable.heightAnchor.constraint(equalToConstant: 22).isActive = true
        topLable.isHidden = true

        
        vinLable.translatesAutoresizingMaskIntoConstraints = false
        vinLable.widthAnchor.constraint(equalToConstant: 45).isActive = true
        vinLable.heightAnchor.constraint(equalToConstant: 22).isActive = true
        vinLable.isHidden = true
        
        
        //Constraintes for creditView subViews
        leasingButton.translatesAutoresizingMaskIntoConstraints = false
        leasingButton.topAnchor.constraint(equalTo: creditView.topAnchor).isActive = true
        leasingButton.bottomAnchor.constraint(equalTo: creditView.bottomAnchor).isActive = true
        leasingButton.leadingAnchor.constraint(equalTo: creditView.leadingAnchor).isActive = true
        leasingButton.widthAnchor.constraint(equalTo: creditView.widthAnchor, multiplier: 0.25).isActive = true
        
        
        mounthlySumLabel.translatesAutoresizingMaskIntoConstraints = false
        mounthlySumLabel.topAnchor.constraint(equalTo: creditView.topAnchor).isActive = true
        mounthlySumLabel.bottomAnchor.constraint(equalTo: creditView.bottomAnchor).isActive = true
        mounthlySumLabel.trailingAnchor.constraint(equalTo: creditView.trailingAnchor).isActive = true
        mounthlySumLabel.widthAnchor.constraint(equalTo: creditView.widthAnchor, multiplier: 0.35).isActive = true
    }
    
    
    
//MARK: - Setup Layouts for imageCollectionView
    
    private func setupFlowLayout() {
        
        layout.itemSize = CGSize(width: 300, height: 242)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        imageCollectionView.collectionViewLayout = layout
    }
    
    
    
//MARK: - Configure UI
    
    private func configureUI() {
        
        //globalView configure
        globalView.backgroundColor = .backgroundSub
        globalView.layer.cornerRadius = 10
        globalView.clipsToBounds = true
        
        
        //globalView's subviews configure
        nameView.backgroundColor = .clear
        priceView.backgroundColor = .clear
        imageCollectionView.backgroundColor = .clear
        sepparator.backgroundColor = .separator
        creditView.backgroundColor = .clear
        
        descriptionStackView.backgroundColor = .clear
        descriptionStackView.axis = .vertical
        descriptionStackView.distribution = .fill
        
        
        //nameView's subViews configure
        let markAttachement = NSTextAttachment()
        let markAttachementSize = CGSize(width: 23, height: 18)
        markAttachement.image = UIImage(systemName: "bookmark")!.withRenderingMode(.alwaysTemplate)
        markAttachement.bounds = CGRect(origin: .zero, size: markAttachementSize)
        let markAttachementString = NSAttributedString(attachment: markAttachement)
        let markAttributedString = NSMutableAttributedString(string: "")
        markAttributedString.append(markAttachementString)
        markAttributedString.addAttribute(.foregroundColor, value: UIColor.fontSub, range: NSRange(location: 0, length: markAttributedString.length))
        markButton.setAttributedTitle(markAttributedString, for: .normal)
        
        
        let hideAttachement = NSTextAttachment()
        let hideAttachementSize = CGSize(width: 23, height: 18)
        hideAttachement.image = UIImage(systemName: "eye.slash")!.withRenderingMode(.alwaysTemplate)
        hideAttachement.bounds = CGRect(origin: .zero, size: hideAttachementSize)
        let hideAttachementString = NSAttributedString(attachment: hideAttachement)
        let hideAttributedString = NSMutableAttributedString(string: "")
        hideAttributedString.append(hideAttachementString)
        hideAttributedString.addAttribute(.foregroundColor, value: UIColor.fontSub, range: NSRange(location: 0, length: hideAttributedString.length))
        hideButton.setAttributedTitle(hideAttributedString, for: .normal)
        
        
        nameCarLable.textAlignment = .left
        nameCarLable.textColor = .fontMain
        nameCarLable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameCarLable.numberOfLines = 0
        
        
        //priceView's subViews configure
        priceLable.textColor = .fontMain
        priceLable.textAlignment = .left
        priceLable.font = UIFont.systemFont(ofSize: 23, weight: .black)
        
        convertPriceLable.textColor = .fontSub
        convertPriceLable.textAlignment = .right
        convertPriceLable.font = UIFont.systemFont(ofSize: 14)
        
        
        //descriptionStackView's subViews configure
        descriptionLable.numberOfLines = 0
        descriptionLable.textColor = .fontMain
        descriptionLable.textAlignment = .left
        descriptionLable.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        optionalViewsStackView.axis = .horizontal
        optionalViewsStackView.distribution = .fillEqually
        optionalViewsStackView.spacing = 5
        
        dateLable.textAlignment = .left
        dateLable.textColor = .fontSub
        dateLable.font = UIFont.systemFont(ofSize: 13)
        
        
        //optionalViewsStackView's subViews configure
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
        
        
        //creditView's subViews configure
        leasingButton.setTitle("Лизинг", for: .normal)
        leasingButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        leasingButton.contentHorizontalAlignment = .left
        leasingButton.setTitleColor(.credit, for: .normal)
        
        mounthlySumLabel.textAlignment = .right
        mounthlySumLabel.textColor = .credit
        mounthlySumLabel.font = UIFont.systemFont(ofSize: 13)
    }
    
    
   
//MARK: - Add Content (public methods)
    
    func addContent(addAdvertisement advt: CarModel) {
        
        nameCarLable.text = advt.carName.rawValue
        priceLable.attributedFontString(text: "\(String(advt.priceByn)) р. ", textRange: "р.", font: UIFont.systemFont(ofSize: 13, weight: .bold))
        convertPriceLable.text = " ≈ \(String(advt.convertationPricetoUsd())) $"
        descriptionLable.text = "\(advt.year) г., \(advt.selector.rawValue), \(advt.engineVolume) л, \(advt.engineType.rawValue), \(advt.bodyType.rawValue), \(advt.mileage) км"
        dateLable.text = advt.city.rawValue + " • " + advt.publicDate
        mounthlySumLabel.attributedFontString(text: "от \(String(advt.leasing())) USD/месяц", textRange: "\(String(advt.leasing())) USD", font: UIFont.systemFont(ofSize: 15, weight: .bold))
    }
    
    
    func appedImageNamesArray(_ imageNamesArray: [String]) {
        for name in imageNamesArray {
            guard let image = UIImage(named: "\(name)") else { return }
            self.imageArray.append(image)
        }
    }
    
    
    func addMarks(_ marks: Mark) {
        switch marks {
        case .top:
            hideButton.isHidden = false
            optionalContantView.isHidden = false
            optionalViewsStackView.isHidden = false
            topLable.isHidden = false
        case .vin:
            optionalContantView.isHidden = false
            optionalViewsStackView.isHidden = false
            vinLable.isHidden = false
        case .topVin:
            hideButton.isHidden = false
            optionalContantView.isHidden = false
            optionalViewsStackView.isHidden = false
            topLable.isHidden = false
            vinLable.isHidden = false
        case.none :
            break
        }
    }
    
    
    
//MARK: - Add targets
    
    private func addTargets() {
        
        hideButton.addTarget(self, action: #selector(hideTapped), for: .touchUpInside)
        markButton.addTarget(self, action: #selector(markTapped), for: .touchUpInside)
        leasingButton.addTarget(self, action: #selector(leasingTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions
    
    @objc private func hideTapped() {
        delegate?.hidden()
    }
    
    @objc private func markTapped() {
        delegate?.mark()
    }
    
    @objc private func leasingTapped() {
        delegate?.leasing()
    }
}



//MARK: - Extention of UICollectionView

extension CarsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let image = imageArray[indexPath.item]
        guard let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "CarsCollectionViewCell", for: indexPath) as? CarsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setImage(image)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        delegate?.ImageItem(indexPath.row)
    }
}


