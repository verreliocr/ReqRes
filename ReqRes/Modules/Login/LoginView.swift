//
//  LoginView.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import UIKit

class LoginView: UIViewController {
    
    let viewModel: ILoginViewModel
    
    init(viewModel: ILoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LoginView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationController?.hideBarIfNecessary()
    }
    
    @IBAction func emailEditingChanged(_ sender: UITextField) {
        viewModel.setEmail(sender.text ?? "")
    }
    
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
        viewModel.setPassword(sender.text ?? "")
    }
    
    private func setupButton() {
        loginButton.addAction { [unowned self] in
            self.viewModel.didTapLogin()
        }
    }

}

extension LoginView: ILoginView {
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void)) {
        switch type {
        case .noConnection:
            showOfflineAlert(retryAction: {
                retryAction()
            })
        case .serverError(let data):
            if let error = ErrorResponse.decode(from: data) {
                showMessage(error.error ?? "", title: "Warning", completion: nil)
            }else{
                showMaintenanceAlert(retryAction: {
                    retryAction()
                })
            }
        }
    }
}
