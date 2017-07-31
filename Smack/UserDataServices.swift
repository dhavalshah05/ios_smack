//
//  UserDataServices.swift
//  Smack
//
//  Created by Dhaval Shah on 31/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import Foundation

class UserDataServices {
    
    static let instance: UserDataServices = UserDataServices()
    
    private init() {}
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
}
