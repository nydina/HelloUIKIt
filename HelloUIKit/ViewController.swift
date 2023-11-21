import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var users: [User] = []
    // lazy: attendre que l'initialisation soit finie pour initialiser le presenter
    lazy var presenter: Presenter = Presenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creer une instance de notre CustomCell
        let customCell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        customCell.nameLabel.text = users[indexPath.row].name
        return customCell
    }
}

extension ViewController: ViewPresenter {
    func getData(data: [User]) {
        self.users = data
        tableView.reloadData()
    }
}
