//
//  CreateAccountModel.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 14/07/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import Foundation
final class CreateAccountModel {
    
    func checkInformation(firstName: String?, lastName: String?, address: String?, birthday: String?) -> Bool {
        let personalInformation = [firstName, lastName, address, birthday]
        let  check = personalInformation.allSatisfy { (information) -> Bool in
            guard let information = information else {
                return false
            }
            if information.isEmpty {
                return false
            }
            return true
        }
        return check
    }
    
    func checkPassword(password: String?, passwordConfirmation: String?) -> Bool {
        if let password = password, let passwordConfirmation = passwordConfirmation {
            if password.isEmpty {
                return false
            }
            if passwordConfirmation == password {
                return true
            }
        }
        return false
    }
}
