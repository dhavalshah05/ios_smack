//
//  ChannelVC.swift
//  Smack
//
//  Created by Dhaval Shah on 30/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // set rear view visible width
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }


    @IBAction func onLoginButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: SEGUE_SHOW_LOGIN_VC, sender: self)
    }

}
