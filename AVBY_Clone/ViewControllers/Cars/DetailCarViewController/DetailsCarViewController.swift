import UIKit

//MARK: - Final class DetailCarViewController

final class DetailsCarViewController: UIViewController {
    
    
//MARK: - Properties of class
    
    private let tableView = UITableView()
    private let callButton = UIButton()
    
    var model: [CarModel] = []
    
    
    
//MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundSub
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailsCarTableViewCell.self, forCellReuseIdentifier: "DetailsCarTableViewCell")
        
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
}



//MARK: - Extention for DetailCarViewController

extension DetailsCarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.model[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCarTableViewCell", for: indexPath) as? DetailsCarTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear

        cell.addContent(addAdverisement: model, 0)
        cell.appedImageNamesArray(model.photosName)
        return cell
    }
    
    
    
    
}
