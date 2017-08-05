//
//  ProfileVC.swift
//  Smack
//
//  Created by Dhaval Shah on 05/08/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var imageViewAvatar: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!

    @IBOutlet weak var labelEmail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        
    }

    
    @IBAction func onCancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onLogoutButtonPressed(_ sender: Any) {
        UserDataServices.instance.logoutUser()
        
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    func setUpView() {
        
        imageViewAvatar.image = UIImage(named: UserDataServices.instance.avatarName)
        imageViewAvatar.backgroundColor = UserDataServices.instance.getAvatarColor()
        
        labelName.text = UserDataServices.instance.name
        labelEmail.text = UserDataServices.instance.email
        
    }
}
