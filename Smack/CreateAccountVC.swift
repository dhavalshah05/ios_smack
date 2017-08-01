//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Dhaval Shah on 31/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    
    @IBOutlet weak var textFieldIUsername: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var imageViewAvatar: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDataServices.instance.avatarName != "" {
            imageViewAvatar.image = UIImage(named: UserDataServices.instance.avatarName)
            self.avatarName = UserDataServices.instance.avatarName
        }
        
    }

    @IBAction func onCancelButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL_VC, sender: nil)
    }
    
    @IBAction func onChooseAvatarButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_SHOW_CHOOSE_AVATAR_VC, sender: nil)
    }
    
    @IBAction func onGenerateBackgroundColorButtonPressed(_ sender: Any) {
        
    }
    

    @IBAction func onCreateButtonPressed(_ sender: Any) {
        
        guard let email = textFieldEmail.text, textFieldEmail.text != "" else { return }
        guard let password = textFieldPassword.text, textFieldPassword.text != "" else { return }
        
        registerUser(email: email, password: password)
        
    }
    
    private func registerUser(email: String, password: String){
        AuthServices.getInstance().registerUser(email: email, password: password) { (success) in
            
            if success {
                
                // login user
                self.loginUser(email: email, password: password)
                
            } else {
                print("Registration failed")
            }
            
        }

    }
    
    private func loginUser(email: String, password: String){
        
        AuthServices.getInstance().loginUser(email: email, password: password) { (success) in
            
            if success {
                
                guard let name = self.textFieldIUsername.text, self.textFieldIUsername.text != "" else { return }
                
                // create user
                self.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor)
                
                
            }else {
                print("Login failed")

            }
            
        }
        
    }
    
    private func createUser(name: String, email: String, avatarName: String, avatarColor: String){
        
        AuthServices.getInstance().createUser(name: name, email: email, avatarName: avatarName, avatarColor: avatarColor) { (success) in
            
            if success {
                
                print("User Id -> \(UserDataServices.instance.id)")
                
            }else {
                print("CreateUser failed")
                
            }

            
        }
        
    }
    
}
