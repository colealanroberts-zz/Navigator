//
//  MainNavigator.swift
//  Navigator
//
//  Created by Cole Roberts on 7/16/19.
//  Copyright © 2019 Cole Roberts. All rights reserved.
//

import UIKit

class MainNavigator: Navigator {
    
    enum Destination {
        case account(user: User)
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
        case .account(let user):
            return AccountViewController(user: user)
        }
    }
}
