import UIKit

//MARK: - Final class CarsViewController

final class CarsViewController: UIViewController {
    
    
    //MARK: - Properties
    
    private let tableView = UITableView()
    
    private let containerView = UIView()
    private let findeMarkButton = UIButton()
    private let parametresButton = UIButton()
    
    private let swipeDownAction = UISwipeGestureRecognizer()
    private let swipeUpAction = UISwipeGestureRecognizer()
    
    private let advertisementsArray = Advertisements()
    
    
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarsTableViewCell.self, forCellReuseIdentifier: "CarsTableViewCell")
        
        view.addSubviews(views: tableView, containerView)
        containerView.addSubviews(views: findeMarkButton, parametresButton)
        view.addGestureRecognizer(swipeDownAction)
        view.addGestureRecognizer(swipeUpAction)
        
        constraintes()
        configureUI()
        addTargets()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setupNavBarColors(UIColor.backgroundSub, UIColor.itemSelected, UIColor.fontMain )
        navigationItem.title = "\(advertisementsArray.carModels.count) объявлений"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(sortedTaped))
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        containerView.isHidden = false
        
        
        findeMarkButton.translatesAutoresizingMaskIntoConstraints = false
        findeMarkButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        findeMarkButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
        findeMarkButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        findeMarkButton.isHidden = false
        
        
        parametresButton.translatesAutoresizingMaskIntoConstraints = false
        parametresButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        parametresButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
        parametresButton.leadingAnchor.constraint(equalTo: findeMarkButton.trailingAnchor, constant:  5).isActive = true
        parametresButton.isHidden = false
    }
    
    
    
//MARK: - ConfigureUI
    
    private func configureUI() {
        
        //tableView config
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        
        
        //containerView and his subViews config
        containerView.backgroundColor = .clear
        
        findeMarkButton.backgroundColor = .itemSelected
        let findeAttachement = NSTextAttachment()
        let findeAttachementSize = CGSize(width: 35, height: 35)
        findeAttachement.image = UIImage(systemName: "bookmark.circle")?.withRenderingMode(.alwaysTemplate)
        findeAttachement.bounds = CGRect(origin: .zero, size: findeAttachementSize)
        let findAttachementString = NSAttributedString(attachment: findeAttachement)
        let findAttributedString = NSMutableAttributedString(string: "")
        findAttributedString.append(findAttachementString)
        findAttributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: findAttributedString.length))
        findeMarkButton.setAttributedTitle(findAttributedString, for: .normal)
        findeMarkButton.layer.cornerRadius = 10
        
        
        parametresButton.backgroundColor = .itemSelected
        let parametresAttachement = NSTextAttachment()
        let parametresAttachementSize = CGSize(width: 20, height: 20)
        parametresAttachement.image = UIImage(systemName: "slider.horizontal.3")?.withRenderingMode(.alwaysTemplate)
        parametresAttachement.bounds = CGRect(origin: .zero, size: parametresAttachementSize)
        let parametresAttachementString = NSAttributedString(attachment: parametresAttachement)
        let parametresAttributedString = NSMutableAttributedString(string: "  Параметры")
        parametresAttributedString.insert(parametresAttachementString, at: 0)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        parametresAttributedString.addAttributes([.foregroundColor: UIColor.white, .paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: parametresAttributedString.length))
        parametresAttributedString.addAttributes([.baselineOffset: 5, .font: UIFont.systemFont(ofSize: 17, weight: .semibold)], range: NSRange(location: 2, length: parametresAttributedString.length - 2))
        parametresButton.setAttributedTitle(parametresAttributedString, for: .normal)
        parametresButton.layer.cornerRadius = 10
    }
    
    
    
//MARK: - Add targets

    private func addTargets() {
        
        findeMarkButton.addTarget(self, action: #selector(findMarkTapped), for: .touchUpInside)
        parametresButton.addTarget(self, action: #selector(parametresTapped), for: .touchUpInside)
    }
    
       
    
//MARK: - Actions
    
    @objc private func findMarkTapped() {
        print("Tapped this button and nothing else metter (:")
    }
    
    
    @objc private func parametresTapped() {
        print("You tapped the parametres button")
    }
    
    
    @objc private func sortedTaped() {
        
        let actionSheet = UIAlertController(title: "Сначала самые", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Актуальные", style: .default, handler: { _ in
            print("Sorted by Актуальные")
        }))
        actionSheet.addAction(UIAlertAction(title: "Дешевые", style: .default, handler: { _ in
            print("Sorted by Дешевые")
        }))
        actionSheet.addAction(UIAlertAction(title: "Дорогие", style: .default, handler: { _ in
            print("Sorted by Дорогие")
        }))
        actionSheet.addAction(UIAlertAction(title: "Новые объявления", style: .default, handler: { _ in
            print("Sorted by Новые объявления")
        }))
        actionSheet.addAction(UIAlertAction(title: "Старые объявления", style: .default, handler: { _ in
            print("Sorted by Старые объявления")
        }))
        actionSheet.addAction(UIAlertAction(title: "С наименьшим пробегом", style: .default, handler: { _ in
            print("Sorted by С наименьшим пробегом")
        }))
        actionSheet.addAction(UIAlertAction(title: "Новые по году", style: .default, handler: { _ in
            print("Sorted by Новые по году")
        }))
        actionSheet.addAction(UIAlertAction(title: "Старые по году", style: .default, handler: { _ in
            print("Sorted by Старые по году")
        }))
        actionSheet.addAction(UIAlertAction(title: "Отменить", style: .cancel))

        present(actionSheet, animated: true)
    }
}
    
    

//MARK: - Extentions of UITableView

extension CarsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advertisementsArray.carModels.count
    }
    
    
    //Settings of the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let advertisement = advertisementsArray.carModels[indexPath.row]
        let photosNameArray = advertisement.photosName
        let marks = advertisement.marks
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarsTableViewCell", for: indexPath) as? CarsTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.addMarks(marks)
        cell.addContent(addAdvertisement: advertisement)
        cell.appedImageNamesArray(photosNameArray)
        cell.delegate = self
        
        return cell
    }
    
    
    //Actons at the scroll moment
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y < 0 {
            containerView.isHidden = true
            findeMarkButton.isHidden = true
            parametresButton.isHidden = true
        } else {
            containerView.isHidden = false
            findeMarkButton.isHidden = false
            parametresButton.isHidden = false
        }
    }
    
    
    //Tap actions of the selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarsTableViewCell", for: indexPath) as? CarsTableViewCell else { return }
        
        let controller = ViewController()
        controller.model = [advertisementsArray.carModels[indexPath.row]]
        
        navigationController?.pushViewController(controller, animated: true)
    }
}



//MARK: - Extention of CarsTableViewCellDelegate

extension CarsViewController: CarsTableViewCellDelegate {
    
    func ImageItem(_ indexPathRow: Int) {
        let controller = ViewController()
        controller.model = [advertisementsArray.carModels[indexPathRow]]
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func hidden() {
        print("Advertisement was hidded")
    }
    
    
    func mark() {
        print("Advertisement was marked")
    }
    
    
    func leasing() {
        print("Leasing info")
//        let controller = ViewController()
//        navigationController?.pushViewController(controller, animated: true)
        
    }
}
