//
//  AuthServices.swift
//  Smack
//
//  Created by Dhaval Shah on 31/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class AuthServices {
    
    private static var instance: AuthServices!
    private let defaults = UserDefaults.standard
    
    private init(){}
    
    static func getInstance() -> AuthServices {
        if instance == nil {
            instance =  AuthServices()
        }
        return instance
    }
    
    
    
    var isLoggedIn: Bool {
        get{
            return defaults.bool(forKey: KEY_IS_LOGGED_IN)
        }
        set{
            defaults.set(newValue, forKey: KEY_IS_LOGGED_IN)
        }
    }
    
    
    var authToken: String{
        get{
            return defaults.value(forKey: KEY_TOKEN) as! String
        }
        set{
            defaults.set(newValue, forKey: KEY_TOKEN)
        }
    }
    
    var userEmail: String{
        get{
            return defaults.value(forKey: KEY_USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: KEY_USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completed: @escaping (_ success: Bool) -> ()){
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body : [String: Any] = [
            "email": email.lowercased(),
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            if response.result.error == nil {
                
                completed(true)
                
            }
            else {
                completed(false)
                debugPrint("ERROR while registering -> \(response.result.error as Any)")
            }
        }
    }
    
    func loginUser(email: String, password: String, completed: @escaping (_ success: Bool) -> ()){
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body : [String: Any] = [
            "email": email.lowercased(),
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil{
                
                guard let data = response.data else {
                    return
                }
                
                let json = JSON(data: data)
                
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                self.isLoggedIn = true
                
                completed(true)
            }else{
                completed(false)
                debugPrint("ERROR while login -> \(response.result.error as Any)")
            }
            
        }
        
    }
    
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String,
                    completed: @escaping (Bool) -> ()){
        
        let body = [
            "name": name,
            "email": email.lowercased(),
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = [
            "Authorization": "Bearer \(AuthServices.getInstance().authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_CREATE_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else { return }
                
                let json = JSON(data: data)
                
                let id = json["_id"].stringValue
                let avatarColor = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                
                // set user data
                
                UserDataServices.instance.setUserData(id: id, avatarColor: avatarColor, avatarName: avatarName, email: email, name: name)
                
                completed(true)
                
                
            } else {
                
                completed(false)
                debugPrint("Error while creating user -> \(response.result.error as Any)")
            }
            
        }
        
    }
    
    
    
    
    
    
    
}
