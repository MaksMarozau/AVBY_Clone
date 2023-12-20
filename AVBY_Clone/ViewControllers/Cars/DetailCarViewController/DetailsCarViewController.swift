import UIKit

//MARK: - Final class DetailCarViewController

final class DetailsCarViewController: UIViewController {
    
    
//MARK: - Properties of class
    
    private let tableView = UITableView()
    
    var model: [CarModel] = []
    
    
    
//MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailsCarTableViewCell.self, forCellReuseIdentifier: "DetailsCarTableViewCell")
        
        view.addSubviews(views: tableView)

        constraintes()
        configureUI()
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    
    
//MARK: - Configuration UI
    
    private func configureUI() {
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
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
        
        cell.backgroundColor = .gray

        cell.addContent(addAdverisement: model, 0)
        return cell
    }
    
    
    
    
}
