//
//  HomeVIewController.swift
//  Navigator
//
//  Created by Cole Roberts on 7/16/19.
//  Copyright © 2019 Cole Roberts. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let user: User
    private let navigator: MainNavigator
    
    // MARK: - Init
    
    public init(navigator: MainNavigator, user: User) {
        self.navigator = navigator
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(onSettingsButtonTouched(_:)))
        view.backgroundColor = .white
        title = "Home"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    @objc
    private func onSettingsButtonTouched(_ sender: Any?) {
        navigator.navigate(to: .account(user: user))
    }
}
