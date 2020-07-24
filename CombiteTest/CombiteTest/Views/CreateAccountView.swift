//
//  CreateAccountView.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 06/07/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import UIKit
import Combine
struct Test {
    let firstName: String?
       let lastName: String?
       let birthday: String?
       let address: String?
       let email: String?
       let password: String?
       let passwordConfirmation: String?
}
class CreateAccountView: UIView {
    private(set) var firstName: PassthroughSubject<String?, Never> = PassthroughSubject()
    private(set) var lastName: PassthroughSubject<String?, Never> = PassthroughSubject()
    private(set) var birthday: PassthroughSubject<String?, Never> = PassthroughSubject()
    private(set) var address: PassthroughSubject<String?, Never> = PassthroughSubject()
    private(set) var email: PassthroughSubject<String?, Never> = PassthroughSubject()
    private(set) var password: PassthroughSubject<String?, Never> = PassthroughSubject()
    private(set) var passwordConfirmation: PassthroughSubject<String?, Never> = PassthroughSubject()
    
//    @Published var teste = Test(
    
    var buttonIsEnabled: Bool = false {
        didSet {
            loginButton.isEnabled = buttonIsEnabled
            if loginButton.isEnabled {
                loginButton.layer.opacity = 1
            } else {
                loginButton.layer.opacity = 0.5
            }
        }
    }
    
    var loginButtonAction: (() -> ())? = nil
    private var textFields: [UITextField:PassthroughSubject<String?, Never>] = [:]
    
    private lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu nome"
        textField.delegate = self
        textFields[textField] = firstName
        return textField
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu sobrenome"
        textField.delegate = self
        textFields[textField] = lastName
        return textField
    }()
    
    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite a data do seu nascimento"
        textField.delegate = self
        textFields[textField] = birthday
        return textField
    }()
    
    private lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu endereço"
        textField.delegate = self
        textFields[textField] = address
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu email"
        textField.delegate = self
        textFields[textField] = email
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha"
        textField.delegate = self
        textFields[textField] = password
        return textField
    }()
    
    private lazy var passwordConfirmationTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirme sua senha"
        textField.delegate = self
        textFields[textField] = passwordConfirmation
        return textField
    }()
    
     private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.isEnabled = false
        button.layer.opacity = 0.5
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func loginButtonClicked() {
        if let action = loginButtonAction {
            action()
        }
    }

}

extension CreateAccountView: CodableView {
    func buildViewHierarchy() {
        addSubview(firstNameTextField)
        addSubview(lastNameTextField)
        addSubview(birthdayTextField)
        addSubview(addressTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(passwordConfirmationTextField)
        addSubview(loginButton)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            firstNameTextField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 50),
            firstNameTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            firstNameTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 5),
            lastNameTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            lastNameTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            birthdayTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 5),
            birthdayTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            birthdayTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            addressTextField.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 5),
            addressTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            addressTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            addressTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            emailTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            passwordTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            passwordConfirmationTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            passwordConfirmationTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            passwordConfirmationTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            passwordConfirmationTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordConfirmationTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            loginButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
    
    
}

extension CreateAccountView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textFields.keys.forEach { (key) in
            if key == textField {
                textFields[key]?.send(textField.text)
            }
        }
    }
}
