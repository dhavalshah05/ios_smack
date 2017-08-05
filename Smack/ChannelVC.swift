//
//  ChannelVC.swift
//  Smack
//
//  Created by Dhaval Shah on 30/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    @IBOutlet weak var imageViewUser: CircleImageView!

    @IBOutlet weak var buttonLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set rear view visible width
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpUserInfo()
    }
    
    @objc func userDataDidChange(_ notif: Notification){
        setUpUserInfo()
    }


    @IBAction func onLoginButtonPressed(_ sender: Any) {
        
        if AuthServices.getInstance().isLoggedIn {
            performSegue(withIdentifier: SEGUE_SHOW_PROFILE_VC, sender: self)
        }else {
            performSegue(withIdentifier: SEGUE_SHOW_LOGIN_VC, sender: self)
        }
        
        
    }

    // for unwinding to ChannelVC
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    func setUpUserInfo() {
        if AuthServices.getInstance().isLoggedIn {
            buttonLogin.setTitle(UserDataServices.instance.name, for: .normal)
            imageViewUser.image = UIImage(named: UserDataServices.instance.avatarName)
            imageViewUser.backgroundColor = UserDataServices.instance.getAvatarColor()
        }else {
            buttonLogin.setTitle("Login", for: .normal)
            imageViewUser.image = UIImage(named: "menuProfileIcon")
            imageViewUser.backgroundColor = UIColor.clear
        }
    }
    
}
