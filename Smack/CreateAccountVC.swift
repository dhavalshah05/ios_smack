//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Dhaval Shah on 31/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onCancelButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL_VC, sender: nil)
    }

}
