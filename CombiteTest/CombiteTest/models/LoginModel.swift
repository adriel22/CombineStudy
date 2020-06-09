//
//  LoginModel.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 05/06/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import Foundation
final class LoginModel {
    
    // MARK: - Temporary mock for check email
    private func checkEmail(email: String?) -> Bool {
        guard let email = email else {
            return false
        }
        if email.contains("@") && email.count > 5 {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Temporary mock for check password
    private func checkPassword(password: String?) -> Bool {
        guard let password = password else {
            return false
        }
        if password.count >= 6 {
            return true
        } else {
            return false
        }
    }
    
    func validateLogin(email: String?, password: String?) -> Bool {
        return checkEmail(email: email) && checkPassword(password: password)
    }
}
