//
//  HomeView.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 22/05/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import UIKit
final class LoginView: UIView {
    @Published var email: String? = ""
    @Published var password: String? = ""
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
    
    var buttonAction: (() -> ())? = nil
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu e-mail"
        textField.delegate = self

        
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
        
        return textField
    }()
    
     private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.isEnabled = false
        button.layer.opacity = 0.5
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
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
    
    @objc private func buttonClicked() {
        if let action = buttonAction {
            action()
        }
    }
}

extension LoginView: CodableView {
    func buildViewHierarchy() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 50),
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
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            loginButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
    
    
}

extension LoginView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailTextField {
            email = textField.text
        } else {
            password = textField.text
        }
    }
}
