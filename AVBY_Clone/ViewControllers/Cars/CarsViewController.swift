import UIKit

//MARK: - Final class CarsViewController

final class CarsViewController: UIViewController {
    
    
//MARK: - Properties
    
    private let tableView = UITableView()
    
    
    
//MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        view.addSubview(tableView)
        
        constraintes()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setupNavBarColors(UIColor.backgroundSub, UIColor.itemSelected, UIColor.fontMain )
    }

    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7).isActive = true

    }
    
    
    
//MARK: - ConfigureUI
    
    private func configureUI() {
        
        
    }
}



extension CarsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
}

