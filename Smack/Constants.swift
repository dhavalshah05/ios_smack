//
//  Constants.swift
//  Smack
//
//  Created by Dhaval Shah on 30/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import Foundation

/* 
 MARK:- URL 
 */
let BASE_URL = "https://ios-smack-app.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"
let URL_CREATE_USER = "\(BASE_URL)/user/add"
let URL_FIND_USER_BY_EMAIL = "\(BASE_URL)/user/byEmail/"


/*
 MARK:- Segues Identifiers
 */

let SEGUE_SHOW_LOGIN_VC = "ShowLoginVC"
let SEGUE_SHOW_CREATE_ACCOUNT_VC = "ShowCreateAccountVC"
let SEGUE_SHOW_CHOOSE_AVATAR_VC = "showChooseAvatarVC"
let SEGUE_SHOW_PROFILE_VC = "showProfileVC"

let UNWIND_TO_CHANNEL_VC = "unwindToChannelVC"


/*
 MARK:- View Identifiers
 */

let AVATAR_CELL = "AvatarCell"


/*
 MARK:- UserDefault Keys
 */

let KEY_TOKEN = "token"
let KEY_IS_LOGGED_IN = "isLoggedIn"
let KEY_USER_EMAIL = "userEmail"

let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

let smackPurplePlaceHolder = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
