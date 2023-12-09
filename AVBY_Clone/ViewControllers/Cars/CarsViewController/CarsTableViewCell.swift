import UIKit

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
    private let postfixLable = UILabel()
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

    
//    var imageArray: [UIImage] = []
//    var countOfView = 0
//    
//    
//    weak var delegate: MainPageCustomeTableViewCellDelegate?
//    
//    var index = 0
    
    
    
    
    //MARK: - Initializations for cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        constraintes()
        
//        setupFlowLayout()
        //        imageCollectionView.register(MainPageCollectionViewCell.self, forCellWithReuseIdentifier: "MainPageCollectionViewCell")
        //        imageCollectionView.delegate = self
        //        imageCollectionView.dataSource = self
        
//        configureUI()
//        targetts()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Add views
    
    private func addViews() {
        
        contentView.addSubview(globalView)
        
        globalView.addSubviews(views: nameView, priceView, imageCollectionView, descriptionStackView, sepparator, creditView)
        
        nameView.addSubviews(views: nameCarLable, hideButton, markButton)
        
        priceView.addSubviews(views: priceLable, postfixLable, convertPriceLable)
        
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
        globalView.backgroundColor = .black
        
        
        //Constraintes for struct container subViews
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: globalView.topAnchor, constant: 5).isActive = true
        nameView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        nameView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        nameView.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        nameView.backgroundColor = .white
        
        
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.topAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        priceView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        priceView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        priceView.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        priceView.widthAnchor.constraint(equalTo: globalView.widthAnchor, multiplier: 0.55).isActive = true
        priceView.backgroundColor = .white


        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: priceView.bottomAnchor).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: 0).isActive = true
        imageCollectionView.heightAnchor.constraint(equalToConstant: 256).isActive = true
        imageCollectionView.backgroundColor = .blue

        
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor).isActive = true
        descriptionStackView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        descriptionStackView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        descriptionStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        descriptionStackView.backgroundColor = .red
        descriptionStackView.axis = .vertical
        descriptionStackView.distribution = .fill
        
        
        sepparator.translatesAutoresizingMaskIntoConstraints = false
        sepparator.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor, constant: 0).isActive = true
        sepparator.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        sepparator.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        sepparator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        sepparator.backgroundColor = .black

        
        creditView.translatesAutoresizingMaskIntoConstraints = false
        creditView.topAnchor.constraint(equalTo: sepparator.bottomAnchor).isActive = true
        creditView.bottomAnchor.constraint(equalTo: globalView.bottomAnchor, constant: -5).isActive = true
        creditView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        creditView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        creditView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        creditView.backgroundColor = .white

        
        //Constraintes for nameView's subViews
        markButton.translatesAutoresizingMaskIntoConstraints = false
        markButton.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 1).isActive = true
        markButton.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: 0).isActive = true
        markButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.10).isActive = true
        markButton.backgroundColor = . orange
        
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.trailingAnchor.constraint(equalTo: markButton.leadingAnchor, constant: 0).isActive = true
        hideButton.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 1).isActive = true
        hideButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.10).isActive = true
        hideButton.backgroundColor = . orange

        nameCarLable.translatesAutoresizingMaskIntoConstraints = false
        nameCarLable.topAnchor.constraint(equalTo: nameView.topAnchor).isActive = true
        nameCarLable.bottomAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        nameCarLable.leadingAnchor.constraint(equalTo: nameView.leadingAnchor).isActive = true
        nameCarLable.trailingAnchor.constraint(equalTo: hideButton.leadingAnchor).isActive = true
        nameCarLable.numberOfLines = 0
        nameCarLable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameCarLable.text = "fkgdgldfgsdfsd"
       
        
        //Constraintes for priceView's subViews
        priceLable.translatesAutoresizingMaskIntoConstraints = false
        priceLable.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 0).isActive = true
        priceLable.bottomAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 0).isActive = true
        priceLable.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 0).isActive = true
        priceLable.widthAnchor.constraint(equalTo: priceView.widthAnchor, multiplier: 0.52).isActive = true
        priceLable.text = "56459"
        priceLable.font = UIFont.systemFont(ofSize: 23, weight: .black)
 
//        postfixLable.translatesAutoresizingMaskIntoConstraints = false
//        postfixLable.leadingAnchor.constraint(equalTo: priceLable.trailingAnchor, constant: 0).isActive = true
//        postfixLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
//        postfixLable.widthAnchor.constraint(equalTo: priceView.widthAnchor, multiplier: 0.1).isActive = true
//        
//        
//        convertPriceLable.translatesAutoresizingMaskIntoConstraints = false
//        convertPriceLable.leadingAnchor.constraint(equalTo: postfixLable.trailingAnchor, constant: 0).isActive = true
//        convertPriceLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
        
        
        //Constraintes for descriptionStackView's subViews
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 35).isActive = true
        descriptionLable.backgroundColor = .orange
        descriptionLable.numberOfLines = 0
        descriptionLable.text = "klsd,gmfs,j/sng.,nxmg/ .ngxk.lgmnk.,s.,mnjl,."
        
        optionalContantView.translatesAutoresizingMaskIntoConstraints = false
        optionalContantView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        optionalContantView.backgroundColor = .gray
        
        dateLable.translatesAutoresizingMaskIntoConstraints = false
        dateLable.heightAnchor.constraint(equalToConstant: 35).isActive = true
        dateLable.backgroundColor = .white
        dateLable.text = "78386539563"
        
        
        //Constraintes for optionalContantView's subViews
        optionalViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        optionalViewsStackView.topAnchor.constraint(equalTo: optionalContantView.topAnchor, constant: 7).isActive = true
        optionalViewsStackView.bottomAnchor.constraint(equalTo: optionalContantView.bottomAnchor, constant: -7).isActive = true
        optionalViewsStackView.widthAnchor.constraint(lessThanOrEqualTo: optionalContantView.widthAnchor, multiplier: 1).isActive = true
        optionalViewsStackView.axis = .horizontal
        optionalViewsStackView.distribution = .fillEqually
        optionalViewsStackView.spacing = 5
        
        topLable.translatesAutoresizingMaskIntoConstraints = false
        topLable.widthAnchor.constraint(equalToConstant: 45).isActive = true
        topLable.heightAnchor.constraint(equalToConstant: 25).isActive = true
        topLable.backgroundColor = .green
        
        vinLable.translatesAutoresizingMaskIntoConstraints = false
        vinLable.widthAnchor.constraint(equalToConstant: 45).isActive = true
        vinLable.heightAnchor.constraint(equalToConstant: 25).isActive = true
        vinLable.backgroundColor = .blue

        
//        //Constraintes for creditView subViews
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
    
    
    
    //MARK: - Configure UI
    
    private func configureUI() {
        
        globalView.backgroundColor = #colorLiteral(red: 0.120668821, green: 0.1256529987, blue: 0.1426913142, alpha: 1)
        globalView.layer.cornerRadius = 10
        globalView.clipsToBounds = true
        
        nameView.backgroundColor = .clear
        priceView.backgroundColor = .clear
        descriptionStackView.backgroundColor = .clear
        creditView.backgroundColor = .clear
        
        imageCollectionView.backgroundColor = .clear
        
        nameCarLable.textAlignment = .left
        nameCarLable.textColor = .white
        nameCarLable.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        
        markButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        
        markButton.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        hideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        hideButton.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        priceLable.textAlignment = .left
        priceLable.textColor = .white
        priceLable.font = UIFont.systemFont(ofSize: 26, weight: .black)
        
        postfixLable.text = "p."
        postfixLable.textColor = .white
        postfixLable.textAlignment = .left
        
        convertPriceLable.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        convertPriceLable.textAlignment = .right
        
        descriptionLable.numberOfLines = 0
        descriptionLable.textColor = .white
        descriptionLable.textAlignment = .left
        descriptionLable.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        dateLable.textAlignment = .left
        dateLable.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        dateLable.font = UIFont.systemFont(ofSize: 13)
        
        sepparator.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        leasingButton.setTitle("Leasing", for: .normal)
        leasingButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        leasingButton.contentHorizontalAlignment = .left
        leasingButton.setTitleColor(#colorLiteral(red: 0.3760706782, green: 0.6299359202, blue: 0.8252221346, alpha: 1), for: .normal)
        
        mounthlySumLabel.textAlignment = .right
        mounthlySumLabel.textColor = #colorLiteral(red: 0.3760706782, green: 0.6299359202, blue: 0.8252221346, alpha: 1)
        mounthlySumLabel.font = UIFont.systemFont(ofSize: 13)
    }
    
    
    
    //MARK: - Setup Layouts for imageCollectionView
    
    private func setupFlowLayout() {
        
        layout.itemSize = CGSize(width: 90, height: 130)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        //        layout.minimumInteritemSpacing = 3
        //        imageCollectionView.isScrollEnabled = true
        imageCollectionView.collectionViewLayout = layout
    }
}

//MARK: - Extantion for sign CollectionView protocols


