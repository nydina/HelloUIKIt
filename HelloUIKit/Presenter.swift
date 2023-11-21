import Foundation
// link between View and Model
// use protocols to link presenter and view
class Presenter {
    let userService = UserService()
    let view: ViewPresenter
    
    init(view: ViewPresenter) {
        self.view = view
    }
    
    func getData() {
        let users = userService.getUsers()
        self.view.getData(data: users)
    }
    
}


protocol ViewPresenter {
    func getData(data: [User])
}
