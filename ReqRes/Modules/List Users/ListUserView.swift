//
//  ListUserView.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import UIKit

class ListUserView: UIViewController {

    @IBOutlet weak var listUserTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
}

extension ListUserView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: UserItemTableCell = tableView.dequeueReusableCell() {
            return cell
        }
        
        return UITableViewCell()
    }
}
