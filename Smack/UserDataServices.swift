//
//  UserDataServices.swift
//  Smack
//
//  Created by Dhaval Shah on 31/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserDataServices {
    
    static let instance: UserDataServices = UserDataServices()
    
    private init() {
    }
    
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
    
    func setAvatarColor(red: String, green: String, blue: String, alpha: String){
        
        var jsonString: String!
        
        let dictionary = ["red" : red, "green" : green, "blue" : blue, "alpha" : alpha]
        
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: dictionary,
            options: []) {
            jsonString = String(data: theJSONData,
                                encoding: .ascii)
        }
        
        self.avatarColor = jsonString
        
    }
    
    func getAvatarColor() -> UIColor{
        
        let json = JSON(parseJSON: self.avatarColor)
        
        let red = CGFloat(json["red"].doubleValue)
        let green = CGFloat(json["green"].doubleValue)
        let blue = CGFloat(json["blue"].doubleValue)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

    
}
