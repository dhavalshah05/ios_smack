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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var buttonCreate: RoundedButton!
    
    var avatarName = "profileDefault"
    var bgColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpView()
        hideActivityIndicator()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.onTap)))
        
        UserDataServices.instance.setAvatarColor(red: "0.5", green: "0.5", blue: "0.5", alpha: "1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDataServices.instance.avatarName != "" {
            imageViewAvatar.image = UIImage(named: UserDataServices.instance.avatarName)
            self.avatarName = UserDataServices.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil{
                imageViewAvatar.backgroundColor = UIColor.gray
            }
        }
        
    }
    

    @IBAction func onCancelButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL_VC, sender: nil)
    }
    
    @IBAction func onChooseAvatarButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_SHOW_CHOOSE_AVATAR_VC, sender: nil)
    }
    
    @IBAction func onGenerateBackgroundColorButtonPressed(_ sender: Any) {
        
        let red = CGFloat(arc4random_uniform(255)) / 255
        let green = CGFloat(arc4random_uniform(255)) / 255
        let blue = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        UIView.animate(withDuration: 0.2) {
            self.imageViewAvatar.backgroundColor = self.bgColor
        }
        
        UserDataServices.instance.setAvatarColor(red: String(describing: red), green: String(describing: green), blue: String(describing: blue), alpha: "1")
    }
    

    @IBAction func onCreateButtonPressed(_ sender: Any) {
        
        guard let email = textFieldEmail.text, textFieldEmail.text != "" else { return }
        guard let password = textFieldPassword.text, textFieldPassword.text != "" else { return }
        
        showActivityIndicator()
        
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
                self.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: UserDataServices.instance.avatarColor)
                
                
            }else {
                print("Login failed")
            }
            
        }
        
    }
    
    private func createUser(name: String, email: String, avatarName: String, avatarColor: String){
        
        AuthServices.getInstance().createUser(name: name, email: email, avatarName: avatarName, avatarColor: avatarColor) { (success) in
            
            if success {
                
                self.hideActivityIndicator()
                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL_VC, sender: nil)
                
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil, userInfo: nil)
                
                print("User Id -> \(UserDataServices.instance.id)")
                
            }else {
                print("CreateUser failed")
                
                self.hideActivityIndicator()
                
            }

            
        }
        
    }
    
    func setUpView(){
        
        textFieldIUsername.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName: smackPurplePlaceHolder])

    
        textFieldEmail.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSForegroundColorAttributeName: smackPurplePlaceHolder])

        textFieldPassword.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName: smackPurplePlaceHolder])

    }
    
    func showActivityIndicator(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        buttonCreate.isHidden = true
    }
    
    func hideActivityIndicator(){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
        buttonCreate.isHidden = false
    }
    
    @objc func onTap(){
        view.endEditing(true)
    }
    
}
