//
//  LoginVC.swift
//  Smack
//
//  Created by Dhaval Shah on 30/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: RoundedButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideSpinner()

    }

    @IBAction func onLoginButtonPressed(_ sender: Any) {
        
        guard let email = textFieldEmail.text, textFieldEmail.text != "" else { return }
        guard let password = textFieldPassword.text, textFieldPassword.text != "" else { return }
        
        showSpinner()
        
        AuthServices.getInstance().loginUser(email: email, password: password) { (success) in
            
            if success {
                
                AuthServices.getInstance().findUserByEmail(completed: { (success) in
                    
                    if success {
                        
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        
                        self.hideSpinner()
                        
                        self.dismiss(animated: true, completion: nil)
                        
                    }else {
                        self.hideSpinner()
                    }
                    
                })
                
            }else {
                self.hideSpinner()
            }
            
        }
    }


    @IBAction func onCancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 

    @IBAction func onCreateAccountButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_SHOW_CREATE_ACCOUNT_VC, sender: nil)
    }

    private func showSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
        
        loginButton.isHidden = true
    }
    
    private func hideSpinner() {
        spinner.isHidden = true
        spinner.stopAnimating()
        
        loginButton.isHidden = false
    }
}
