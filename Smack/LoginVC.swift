//
//  LoginVC.swift
//  Smack
//
//  Created by Dhaval Shah on 30/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }



    @IBAction func onCancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 

    @IBAction func onCreateAccountButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_SHOW_CREATE_ACCOUNT_VC, sender: nil)
    }

}
