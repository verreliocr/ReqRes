//
//  ListUserView.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import UIKit

class ListUserView: UIViewController {
    
    let viewModel: IListUserViewModel
    
    init(viewModel: IListUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ListUserView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var listUserTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "ReqRes Users"
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationController?.showBarIfNecessary()
    }
    
    private func setupTableView() {
        listUserTableView.rowHeight = UITableView.automaticDimension
        listUserTableView.estimatedRowHeight = 200
        listUserTableView.delegate = self
        listUserTableView.dataSource = self
        listUserTableView.register([UserItemTableCell.self])
    }

}

extension ListUserView: IListUserView {
    func reloadView() {
        DispatchQueue.main.async { [unowned self] in
            self.listUserTableView.reloadData()
        }
    }
    
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void)) {
        switch type {
        case .noConnection:
            showOfflineAlert(retryAction: {
                retryAction()
            })
        case .serverError:
            showMaintenanceAlert(retryAction: {
                retryAction()
            })
        }
    }
}

extension ListUserView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        viewModel.willDisplayUser(for: row)
    }
}

extension ListUserView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfUsers()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: UserItemTableCell = tableView.dequeueReusableCell() {
            
            let row = indexPath.row
            
            cell.bind(avatarUrl: viewModel.getAvatarUrl(for: row),
                      name: viewModel.getFullName(for: row),
                      email: viewModel.getEmail(for: row))
            
            return cell
        }
        
        return UITableViewCell()
    }
}
