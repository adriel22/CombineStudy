
//
//  CreateAccountController.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 06/07/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import UIKit
import Combine
final class CreateAccountViewController: UIViewController {
    
    var sub: AnyCancellable!
    private let model = CreateAccountModel()
    
    private let customView = CreateAccountView()
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let information = Publishers.CombineLatest4(customView.firstName, customView.lastName, customView.address, customView.birthday)
            .map({ (name, lastName, address, birthday) -> Bool in
                return self.model.checkInformation(firstName: name, lastName: lastName, address: address, birthday: birthday)
            })
        
        let password = Publishers.CombineLatest(customView.password, customView.passwordConfirmation)
            .map { (password, confirmation) -> Bool in
                return self.model.checkPassword(password: password, passwordConfirmation: confirmation)
        }
        
        let email = customView.email.map { (email) -> Bool in
            return true
        }
        
        sub = Publishers.CombineLatest3(information, password, email)
            .map({ (infoCheck, emailCheck, passwordCheck) -> Bool in
                return infoCheck && emailCheck && passwordCheck
            })
            .assign(to: \.buttonIsEnabled, on: customView)

        
    }
}
