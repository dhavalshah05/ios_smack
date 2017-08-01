//
//  AvatarCell.swift
//  Smack
//
//  Created by Dhaval Shah on 01/08/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import UIKit

enum AvatarType {
    case DARK
    case LIGHT
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setUpView(){
        
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true

    }
    
    func configureCell(index: Int, avatarType: AvatarType){
        if avatarType == AvatarType.DARK {
            
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
            
        } else{
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
}
