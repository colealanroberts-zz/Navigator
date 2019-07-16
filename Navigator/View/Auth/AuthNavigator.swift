//
//  AuthNavigator.swift
//  Navigator
//
//  Created by Cole Roberts on 7/16/19.
//  Copyright © 2019 Cole Roberts. All rights reserved.
//

import UIKit

class AuthNavigator: Navigator {
    
    enum Destination {
        case signUp
        case forgotPassword
        case home(user: User)
    }
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(to destination: Destination) {
        let vc = viewController(for: destination)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func viewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .forgotPassword:
            return ForgotPasswordViewController()
            
        case .signUp:
            return SignUpViewController()
            
        case .home(let user):
            return HomeViewController(navigator: MainNavigator(navigationController: self.navigationController!), user: user)
        }
    }
}
