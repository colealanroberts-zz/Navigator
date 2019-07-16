//
//  Navigator.swift
//  Navigator
//
//  Created by Cole Roberts on 7/16/19.
//  Copyright © 2019 Cole Roberts. All rights reserved.
//

import UIKit

protocol Navigator {
    associatedtype Destination
    
    func navigate(to destination: Destination)
}
