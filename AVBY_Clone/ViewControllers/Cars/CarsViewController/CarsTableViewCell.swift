import UIKit

final class CarsTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    //    var imageArray: [UIImage] = []
    //    var countOfView = 0
    
    private let globalView = UIView()
    
    private let nameView = UIView()
    private let priceView = UIView()
    private var imageCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let descriptionView = UIView()
    private let creditView = UIView()
    
    private let layout = UICollectionViewFlowLayout()
    
    let nameCarLable = UILabel()
    private let hideButton = UIButton()
    private let markButton = UIButton()
    
    let priceLable = UILabel()
    private let postfixLable = UILabel()
    let convertPriceLable = UILabel()
    
    let descriptionLable = UILabel()
    let dateLable = UILabel()
    
    private let sepparator = UIView()
    private let leasingButton = UIButton()
    let mounthlySumLabel = UILabel()
    
    //    weak var delegate: MainPageCustomeTableViewCellDelegate?
    
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
        
        globalView.addSubviews(views: nameView, priceView, imageCollectionView, descriptionView, creditView)
        
        nameView.addSubviews(views: nameCarLable, hideButton, markButton)
        
        priceView.addSubviews(views: priceLable, postfixLable, convertPriceLable)
        
        descriptionView.addSubviews(views: descriptionLable, dateLable)
        
        creditView.addSubviews(views: sepparator, leasingButton, mounthlySumLabel)
    }
    
    
    
    //MARK: - Constraintes
    
    private func constraintes() {
        
        //for container view
        globalView.translatesAutoresizingMaskIntoConstraints = false
        globalView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        globalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        globalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        globalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        globalView.backgroundColor = .black
        
        
        //for container subViews
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: globalView.topAnchor, constant: 10).isActive = true
        nameView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        nameView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        nameView.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        nameView.backgroundColor = .white
        
        
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 5).isActive = true
        priceView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        priceView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        priceView.widthAnchor.constraint(equalTo: globalView.widthAnchor, multiplier: 0.55).isActive = true
        priceView.backgroundColor = .white


        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 5).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: 0).isActive = true
        imageCollectionView.heightAnchor.constraint(equalToConstant: 261).isActive = true

        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 5).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        descriptionView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        descriptionView.backgroundColor = .white

        
        creditView.translatesAutoresizingMaskIntoConstraints = false
        creditView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 5).isActive = true
        creditView.bottomAnchor.constraint(equalTo: globalView.bottomAnchor, constant: -10).isActive = true
        creditView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        creditView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        creditView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        creditView.backgroundColor = .white

        
        //Constraintes for nameView subViews
        markButton.translatesAutoresizingMaskIntoConstraints = false
        markButton.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 1).isActive = true
        markButton.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: 0).isActive = true
        markButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.10).isActive = true
        
        
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.trailingAnchor.constraint(equalTo: markButton.leadingAnchor, constant: 0).isActive = true
        hideButton.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 1).isActive = true
        hideButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.10).isActive = true
        
        
        nameCarLable.translatesAutoresizingMaskIntoConstraints = false
        nameCarLable.topAnchor.constraint(equalTo: nameView.topAnchor).isActive = true
        nameCarLable.bottomAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        nameCarLable.leadingAnchor.constraint(equalTo: nameView.leadingAnchor).isActive = true
        nameCarLable.trailingAnchor.constraint(equalTo: hideButton.leadingAnchor).isActive = true
        nameCarLable.numberOfLines = 0
        nameCarLable.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        nameCarLable.text = "fkgdgldfgsdfsd"
//        
//        
//        //Constraintes for priceView subViews
//        priceLable.translatesAutoresizingMaskIntoConstraints = false
//        priceLable.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 0).isActive = true
//        priceLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
//        priceLable.widthAnchor.constraint(equalTo: priceView.widthAnchor, multiplier: 0.52).isActive = true
//        
//        
//        postfixLable.translatesAutoresizingMaskIntoConstraints = false
//        postfixLable.leadingAnchor.constraint(equalTo: priceLable.trailingAnchor, constant: 0).isActive = true
//        postfixLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
//        postfixLable.widthAnchor.constraint(equalTo: priceView.widthAnchor, multiplier: 0.1).isActive = true
//        
//        
//        convertPriceLable.translatesAutoresizingMaskIntoConstraints = false
//        convertPriceLable.leadingAnchor.constraint(equalTo: postfixLable.trailingAnchor, constant: 0).isActive = true
//        convertPriceLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
//        
//        
//        //Constraintes for descriptionView subViews
//        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLable.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 0).isActive = true
//        descriptionLable.widthAnchor.constraint(equalTo: descriptionView.widthAnchor, multiplier: 1).isActive = true
//        descriptionLable.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.5).isActive = true
//        
//        
//        dateLable.translatesAutoresizingMaskIntoConstraints = false
//        dateLable.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 0).isActive = true
//        dateLable.widthAnchor.constraint(equalTo: descriptionView.widthAnchor, multiplier: 1).isActive = true
//        dateLable.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.5).isActive = true
//        
//        
//        //Constraintes for creditView subViews
//        sepparator.translatesAutoresizingMaskIntoConstraints = false
//        sepparator.topAnchor.constraint(equalTo: creditView.topAnchor, constant: 0).isActive = true
//        sepparator.leadingAnchor.constraint(equalTo: creditView.leadingAnchor, constant: 10).isActive = true
//        sepparator.trailingAnchor.constraint(equalTo: creditView.trailingAnchor, constant: 0).isActive = true
//        sepparator.heightAnchor.constraint(equalToConstant: 2).isActive = true
//        
//        
//        leasingButton.translatesAutoresizingMaskIntoConstraints = false
//        leasingButton.topAnchor.constraint(equalTo: sepparator.bottomAnchor, constant: 0).isActive = true
//        leasingButton.bottomAnchor.constraint(equalTo: creditView.bottomAnchor, constant: 0).isActive = true
//        leasingButton.leadingAnchor.constraint(equalTo: creditView.leadingAnchor, constant: 0).isActive = true
//        leasingButton.widthAnchor.constraint(equalTo: creditView.widthAnchor, multiplier: 0.25).isActive = true
//        
//        
//        mounthlySumLabel.translatesAutoresizingMaskIntoConstraints = false
//        mounthlySumLabel.topAnchor.constraint(equalTo: sepparator.bottomAnchor, constant: 0).isActive = true
//        mounthlySumLabel.bottomAnchor.constraint(equalTo: creditView.bottomAnchor, constant: 0).isActive = true
//        mounthlySumLabel.trailingAnchor.constraint(equalTo: creditView.trailingAnchor, constant: 0).isActive = true
//        mounthlySumLabel.widthAnchor.constraint(equalTo: creditView.widthAnchor, multiplier: 0.35).isActive = true
    }
    
    
    
    //MARK: - Configure UI
    
    private func configureUI() {
        
        globalView.backgroundColor = #colorLiteral(red: 0.120668821, green: 0.1256529987, blue: 0.1426913142, alpha: 1)
        globalView.layer.cornerRadius = 10
        globalView.clipsToBounds = true
        
        nameView.backgroundColor = .clear
        priceView.backgroundColor = .clear
        descriptionView.backgroundColor = .clear
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


