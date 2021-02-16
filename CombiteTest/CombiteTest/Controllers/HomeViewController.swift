//
//  HomeViewController.swift
//  CombiteTest
//
//  Created by adriel.de.a.freire on 28/06/20.
//  Copyright © 2020 adriel.de.a.freire. All rights reserved.
//

import Foundation
import Combine
import UIKit
final class HomeViewController: UIViewController {
    var timer: AnyCancellable?

    private var countdown = 10 {
        didSet {
            if countdown == 0 {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    private let customView = HomeView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.buttonAction = addTime
        
//        let subject = PassthroughSubject<Int, Never>()
//        subject.
        
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { (date) in
                self.countdown -= 1
        })
    }
    
    private func addTime() {
        countdown += 10
    }
}
