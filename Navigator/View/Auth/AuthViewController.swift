//
//  ViewController.swift
//  Navigator
//
//  Created by Cole Roberts on 7/16/19.
//  Copyright © 2019 Cole Roberts. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - Properties
    
    private let navigator: AuthNavigator
    private let supplementaryView = AuthSupplementaryView()
    
    // MARK: - Init
    
    init(navigator: AuthNavigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Auth"
        view.backgroundColor = .white
        addTargets()
    }
    
    override func loadView() {
        view = supplementaryView
    }
    
    // MARK: - Private
    
    private func addTargets() {
        supplementaryView.forgotPasswordButton.addTarget(self, action: #selector(onForgotPasswordButtonTouched(_:)), for: .touchUpInside)
        supplementaryView.signInButton.addTarget(self, action: #selector(onSignInButtonTouched(_:)), for: .touchUpInside)
    }
    
    // MARK: - UI
    
    @objc
    private func onForgotPasswordButtonTouched(_ sender: Any?) {
        navigator.navigate(to: .forgotPassword)
    }
    
    @objc
    private func onSignInButtonTouched(_ sender: Any?) {
        supplementaryView.spinner.startAnimating()
        supplementaryView.signInButton.isEnabled = false
        
        NetworkManager.shared.simulateAsyncRequest(delay: 2.0) { [weak self] (result) in
            switch result {
            case .success:
                let user = User(firstName: "Cole", lastName: "Roberts")
        
                self?.supplementaryView.signInButton.isEnabled = true
                self?.supplementaryView.spinner.stopAnimating()
                self?.navigator.navigate(to: .home(user: user))
            case .failure: print("Failed!")
            }
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for v in views {
            addArrangedSubview(v)
        }
    }
}

class AuthSupplementaryView: UIView {
    
    // MARK: - Properties
    
    public lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Forgot Password", comment: "Forgot password button title"), for: .normal)
        button.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }()
    
    public lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Sign In", comment: "Sign In button title"), for: .normal)
        button.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }()
    
    public lazy var spinner: UIActivityIndicatorView = {
        let iv = UIActivityIndicatorView(style: .gray)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.style = .gray
        iv.isHidden = true
        addSubview(iv)
        
        return iv
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: .zero)
        constructView()
    }
    
    // MARK: - Private
    
    private func constructView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        stackView.addArrangedSubviews([forgotPasswordButton, signInButton])
        
        addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
