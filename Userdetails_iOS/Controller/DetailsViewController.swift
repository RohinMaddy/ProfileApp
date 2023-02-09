//
//  DetailsViewController.swift
//  Userdetails_iOS
//
//  Created by Santhy Rachel Thomas on 08/02/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var credentials: Credentials?


    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    func populateView() {
        if let credentials = credentials {
            nameLabel.text = credentials.name
            emailLabel.text = credentials.email
            usernameLabel.text = credentials.username
            passwordTextField.text = credentials.password
        }
    }

    @IBAction func togglePasswordVisibilityButton(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
}
