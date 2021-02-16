//
//  HomeView.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 28/06/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import UIKit
final class HomeView: UIView {
    private let checkStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    var buttonAction: (() -> ())? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClicked() {
        if let action = buttonAction {
            action()
        }
    }
}

extension HomeView: CodableView {
    func buildViewHierarchy() {
        addSubview(checkStatusButton)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            checkStatusButton.heightAnchor.constraint(equalToConstant: 50),
            checkStatusButton.widthAnchor.constraint(equalToConstant: 50),
            checkStatusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            checkStatusButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
    
}
