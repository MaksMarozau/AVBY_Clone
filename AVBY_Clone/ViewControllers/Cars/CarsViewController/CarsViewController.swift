import UIKit

//MARK: - Final class CarsViewController

final class CarsViewController: UIViewController {
    
    
//MARK: - Properties
    
    private let tableView = UITableView()
    
    var advertisementsArray = Advertisements()
    
    
//MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarsTableViewCell.self, forCellReuseIdentifier: "CarsTableViewCell")
       
        view.addSubview(tableView)
        
        constraintes()
        configureUI()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setupNavBarColors(UIColor.backgroundSub, UIColor.itemSelected, UIColor.fontMain )
        navigationItem.title = "\(advertisementsArray.carModels.count) объявления"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: nil, action: #selector(sortedTaped))
    }

    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true

    }
    
    
    
//MARK: - ConfigureUI
    
    private func configureUI() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    
//MARK: - Actions
    
    @objc func sortedTaped() {
        print("Sorted")
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
        
        return cell
        
      
    }
}

