//
//  ViewController.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 28/05/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import UIKit
import Combine

final class LoginViewController: UIViewController {
    private let customView = LoginView()
    private var sub: AnyCancellable!
    private let model = LoginModel()

    override func loadView() {
        view = customView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        sub = Publishers.CombineLatest<Published<String?>.Publisher, Published<String?>.Publisher>(customView.$email, customView.$password)
            .map({ (email, password) -> Bool in
                return self.model.validateLogin(email: email, password: password)
            })
            .assign(to: \.buttonIsEnabled, on: customView)
        
        customView.loginButtonAction = login
        customView.createAccountButtonAction = createAccount
    }
    
    private func login(){
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func createAccount() {
        let vc = CreateAccountViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    

}

