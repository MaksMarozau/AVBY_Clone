import UIKit

//MARK: - Final class DetailCarViewController

final class DetailsCarViewController: UIViewController {
    
    
//MARK: - Properties of class
    
    //for UI creating
    private let tableView = UITableView()
    private let callButton = UIButton()
    
    
    enum TypeOfCells {
        case main
        case additional(title: String, subTitle: String)
        case end
    }
    
    
    //support properties
    var model: [CarModel] = []
    
    
    
//MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundMain
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailsCarMainTableViewCell.self, forCellReuseIdentifier: "DetailsCarMainTableViewCell")
        tableView.register(DetailsCarAdditionalTableViewCell.self, forCellReuseIdentifier: "DetailsCarAdditionalTableViewCell")
        tableView.register(DetailCarsEndTableViewCell.self, forCellReuseIdentifier: "DetailCarsEndTableViewCell")
        
        view.addSubviews(views: tableView, callButton)

        constraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(menuTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backTapped))
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        callButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -43).isActive = true
        callButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        callButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97).isActive = true
    }
    
    
    
//MARK: - Configuration UI
    
    private func configureUI() {
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        
        
        callButton.setTitle("Позвонить...", for: .normal)
        callButton.setTitleColor(.white, for: .normal)
        callButton.titleLabel?.textAlignment = .center
        callButton.backgroundColor = UIColor.vin
        callButton.layer.cornerRadius = 10
    }
    
    
    
//MARK: - Actions
    
    @objc private func menuTapped() {
        print("You tapped Menu")
    }
    
    @objc private func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
//MARK: - Type of cells
    
    private func createTypesOfTableViewCells() -> [TypeOfCells] {
    
        var complectationString: String = ""
        model[0].complectation.forEach({ complectationString = complectationString + $0.rawValue + "\n" })
        
        var changeString: String = ""
        model[0].change.forEach({ changeString = changeString + $0.rawValue + "\n" })
        
        let cells: [TypeOfCells] = [
            .main,
            .additional(title: "Описаие", subTitle: model[0].dascription),
            .additional(title: "Комплектация", subTitle: complectationString),
            .additional(title: "Обмен", subTitle: changeString),
            .end
        ]
        
        return cells
    }
}



//MARK: - Extention for DetailCarViewController

extension DetailsCarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cells = createTypesOfTableViewCells()
        return cells.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.model[0]
        let cells = createTypesOfTableViewCells()
        
        switch cells[indexPath.row] {
        case .main:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCarMainTableViewCell", for: indexPath) as? DetailsCarMainTableViewCell else { return UITableViewCell() }
            
            cell.backgroundColor = .backgroundSub
            cell.addContent(addAdverisement: model, 0)
            cell.appedImageNamesArray(model.photosName)
            return cell
            
        case .additional(let description):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCarAdditionalTableViewCell", for: indexPath) as? DetailsCarAdditionalTableViewCell else { return UITableViewCell() }
            
            cell.backgroundColor = .clear
            cell.setTitleText(description.title)
            cell.setDescriptionText(description.subTitle)
            return cell
            
        case .end:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCarsEndTableViewCell", for: indexPath) as? DetailCarsEndTableViewCell else { return UITableViewCell() }
            
            cell.backgroundColor = .clear
            return cell
        }
    }
}
