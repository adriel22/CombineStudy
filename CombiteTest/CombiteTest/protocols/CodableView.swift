//
//  CodableView.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 22/05/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import Foundation
protocol CodableView {
    
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupView()
    
}

extension CodableView {
    
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionalConfiguration()
    }
    
}
