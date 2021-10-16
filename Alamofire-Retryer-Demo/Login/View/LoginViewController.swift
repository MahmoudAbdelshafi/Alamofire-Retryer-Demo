//
//  ViewController.swift
//  Alamofire-Retryer-Demo
//
//  Created by Mahmoud Abdelshafi on 16/10/2021.
//

import UIKit
import Alamofire
import Combine

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var viewModel: LoginViewModel = {
        return LoginViewModel()
    }()
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var apiKeyTF: UITextField!
    @IBOutlet weak var secretKeyTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigateToListIfLogedIn()
    }
    
    //MARK: - IBActions
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        guard let apiKey = apiKeyTF.text, let secretKey = secretKeyTF.text else { return }
        viewModel.login(apiKey: apiKey, secretKey: secretKey)
    }
    
}

//MARK: - Private Methods

extension LoginViewController {
    
    private func navigateToListIfLogedIn() {
        if let _ = UserDefaultsManager.shared.getToken() {
            performSegue(withIdentifier: "toListView", sender: self)
        }
    }
}
