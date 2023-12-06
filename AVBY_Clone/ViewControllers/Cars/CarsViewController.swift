import UIKit

class CarsViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor = .black
        
//        self.title = "xxxx объявлений"
        

        view.addSubview(button)
        button.frame = CGRect(x: 150, y: 300, width: 120, height: 60)
        button.setTitle("push", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
    }

    
    @objc func push() {
        let controller = ViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}

