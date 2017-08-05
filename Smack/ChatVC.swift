//
//  ChatVC.swift
//  Smack
//
//  Created by Dhaval Shah on 30/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var menuButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // link SWReveal to button
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        /*
         Check if the user is logged in or not.
         If logged in, get the user data and send notification 
         */
        if AuthServices.getInstance().isLoggedIn {
            
            AuthServices.getInstance().findUserByEmail(completed: { (result) in
                
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                
            })
        }
    }

   

}
