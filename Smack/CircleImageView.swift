//
//  CircleImageView.swift
//  Smack
//
//  Created by Dhaval Shah on 01/08/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {

 
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
