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
        
        setupFlowLayout()
        //        imageCollectionView.register(MainPageCollectionViewCell.self, forCellWithReuseIdentifier: "MainPageCollectionViewCell")
        //        imageCollectionView.delegate = self
        //        imageCollectionView.dataSource = self
        
        configureUI()
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
        
        
        //Constraintes for struct container subViews
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
        imageCollectionView.heightAnchor.constraint(equalToConstant: 240).isActive = true

        
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 5).isActive = true
        descriptionStackView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        descriptionStackView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        descriptionStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        
        
        sepparator.translatesAutoresizingMaskIntoConstraints = false
        sepparator.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor).isActive = true
        sepparator.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        sepparator.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        sepparator.heightAnchor.constraint(equalToConstant: 1).isActive = true

        
        creditView.translatesAutoresizingMaskIntoConstraints = false
        creditView.topAnchor.constraint(equalTo: sepparator.bottomAnchor).isActive = true
        creditView.bottomAnchor.constraint(equalTo: globalView.bottomAnchor).isActive = true
        creditView.leadingAnchor.constraint(equalTo: globalView.leadingAnchor, constant: 10).isActive = true
        creditView.trailingAnchor.constraint(equalTo: globalView.trailingAnchor, constant: -10).isActive = true
        creditView.heightAnchor.constraint(equalToConstant: 45).isActive = true

        
        //Constraintes for nameView's subViews
        markButton.translatesAutoresizingMaskIntoConstraints = false
        markButton.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 1).isActive = true
        markButton.trailingAnchor.constraint(equalTo: nameView.trailingAnchor).isActive = true
        markButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.10).isActive = true
        
        
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.trailingAnchor.constraint(equalTo: markButton.leadingAnchor).isActive = true
        hideButton.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 1).isActive = true
        hideButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.10).isActive = true

        
        nameCarLable.translatesAutoresizingMaskIntoConstraints = false
        nameCarLable.topAnchor.constraint(equalTo: nameView.topAnchor).isActive = true
        nameCarLable.bottomAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        nameCarLable.leadingAnchor.constraint(equalTo: nameView.leadingAnchor).isActive = true
        nameCarLable.trailingAnchor.constraint(equalTo: hideButton.leadingAnchor).isActive = true
               
        
        //Constraintes for priceView's subViews
        priceLable.translatesAutoresizingMaskIntoConstraints = false
        priceLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
        priceLable.widthAnchor.constraint(equalTo: priceView.widthAnchor, multiplier: 0.55).isActive = true
 
 
        convertPriceLable.translatesAutoresizingMaskIntoConstraints = false
        convertPriceLable.leadingAnchor.constraint(equalTo: priceLable.trailingAnchor).isActive = true
        convertPriceLable.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 1).isActive = true
        
        
        //Constraintes for descriptionStackView's subViews
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 35).isActive = true
        
        
        optionalContantView.translatesAutoresizingMaskIntoConstraints = false
        optionalContantView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        dateLable.translatesAutoresizingMaskIntoConstraints = false
        dateLable.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        //Constraintes for optionalContantView's subViews
        optionalViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        optionalViewsStackView.topAnchor.constraint(equalTo: optionalContantView.topAnchor, constant: 6).isActive = true
        optionalViewsStackView.bottomAnchor.constraint(equalTo: optionalContantView.bottomAnchor, constant: -6).isActive = true
        optionalViewsStackView.widthAnchor.constraint(lessThanOrEqualTo: optionalContantView.widthAnchor, multiplier: 1).isActive = true
        
        
        topLable.translatesAutoresizingMaskIntoConstraints = false
        topLable.widthAnchor.constraint(equalToConstant: 45).isActive = true
        topLable.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        
        vinLable.translatesAutoresizingMaskIntoConstraints = false
        vinLable.widthAnchor.constraint(equalToConstant: 45).isActive = true
        vinLable.heightAnchor.constraint(equalToConstant: 23).isActive = true

        
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
    
    
    
//MARK: - Configure UI
    
    private func configureUI() {
        
        //globalView configure
        globalView.backgroundColor = .backgroundSub
        globalView.layer.cornerRadius = 10
        globalView.clipsToBounds = true
        
        
        //globalView's subviews configure
        nameView.backgroundColor = .clear
        priceView.backgroundColor = .clear
        imageCollectionView.backgroundColor = .black
        sepparator.backgroundColor = .separator
        creditView.backgroundColor = .clear

        descriptionStackView.backgroundColor = .clear
        descriptionStackView.axis = .vertical
        descriptionStackView.distribution = .fill
        
        
        //nameView's subViews configure
        markButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        markButton.tintColor = .fontSub
        
        hideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        hideButton.tintColor = .fontSub
        
        nameCarLable.textAlignment = .left
        nameCarLable.textColor = .fontMain
        nameCarLable.font = UIFont.systemFont(ofSize: 17, weight: .regular)//
        nameCarLable.numberOfLines = 0
        nameCarLable.text = "dskjgfs.,jg"
        
 
        //priceView's subViews configure
        priceLable.textAlignment = .left
        priceLable.textColor = .fontMain
        priceLable.font = UIFont.systemFont(ofSize: 23, weight: .black)
        priceLable.text = "343434"

        convertPriceLable.textColor = .fontSub
        convertPriceLable.textAlignment = .right
  
        
        //descriptionStackView's subViews configure
        descriptionLable.numberOfLines = 0
        descriptionLable.textColor = .fontMain
        descriptionLable.textAlignment = .left
        descriptionLable.font = UIFont.systemFont(ofSize: 15, weight: .light)
        descriptionLable.text = "klsd,gmfs,j/sng.,nxmg/ .ngxk.lgmnk.,s.,mnjl,."
        
        optionalViewsStackView.axis = .horizontal
        optionalViewsStackView.distribution = .fillEqually
        optionalViewsStackView.spacing = 5

        dateLable.textAlignment = .left
        dateLable.textColor = .fontSub
        dateLable.font = UIFont.systemFont(ofSize: 13)
        dateLable.text = "78386539563"
        
        //optionalViewsStackView's subViews configure
        topLable.backgroundColor = .top
        topLable.layer.cornerRadius = 3
        topLable.clipsToBounds = true
        
        vinLable.backgroundColor = .vin
        vinLable.layer.cornerRadius = 3
        vinLable.clipsToBounds = true


        //creditView's subViews configure
        leasingButton.setTitle("Лизинг", for: .normal)
        leasingButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        leasingButton.contentHorizontalAlignment = .left
        leasingButton.setTitleColor(.credit, for: .normal)
        
        mounthlySumLabel.textAlignment = .right
        mounthlySumLabel.textColor = .credit
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


