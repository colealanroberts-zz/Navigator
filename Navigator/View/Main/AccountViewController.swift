//
//  AccountViewController.swift
//  Navigator
//
//  Created by Cole Roberts on 7/16/19.
//  Copyright © 2019 Cole Roberts. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let user: User
    
    public init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
        updateUI(with: user)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    private func updateUI(with model: User) {
        title = "Welcome back, \(model.firstName)"
    }
}
