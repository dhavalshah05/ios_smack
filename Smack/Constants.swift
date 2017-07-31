//
//  Constants.swift
//  Smack
//
//  Created by Dhaval Shah on 30/07/17.
//  Copyright © 2017 ITGo Software Solutions. All rights reserved.
//

import Foundation

// URL

let BASE_URL = "https://ios-smack-app.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"
let URL_CREATE_USER = "\(BASE_URL)/user/add"

// Segues
let SEGUE_SHOW_LOGIN_VC = "ShowLoginVC"
let SEGUE_SHOW_CREATE_ACCOUNT_VC = "ShowCreateAccountVC"
let UNWIND_TO_CHANNEL_VC = "unwindToChannelVC"

// User Defaults Key
let KEY_TOKEN = "token"
let KEY_IS_LOGGED_IN = "isLoggedIn"
let KEY_USER_EMAIL = "userEmail"


