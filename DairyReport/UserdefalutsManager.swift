//
//  UserdefalutsManager.swift
//  DairyReport
//
//  Created by popota on 2017/04/22.
//  Copyright © 2017年 popota. All rights reserved.
//

import Foundation

enum UserDefaultKey: String {
    case togglApiKey = "togglApiKey"
    case togglUserAgent = "togglUserAgent"
    case togglWorkSpace = "togglWorkSpace"
    case dev = "dev"
    case name = "name"
    case outputMode = "outputMode"
}

enum OutputModeType: String {
    case mail = "mail"
    case slack =  "slack"
}

struct UserdefaultsManager {
    
    let userdefaults = UserDefaults.standard
    
    var togglApiLey: String? {
        get {
            return userdefaults.string(forKey: UserDefaultKey.togglApiKey.rawValue)
        }
        set {
            userdefaults.set(newValue, forKey: UserDefaultKey.togglApiKey.rawValue)
        }
    }
    
    var togglUserAgent: String? {
        get {
            return userdefaults.string(forKey: UserDefaultKey.togglUserAgent.rawValue)
        }
        set {
            userdefaults.set(newValue, forKey: UserDefaultKey.togglUserAgent.rawValue)
        }
    }
    
    var togglWorkSpace: String? {
        get {
            return userdefaults.string(forKey: UserDefaultKey.togglWorkSpace.rawValue)
        }
        set {
            userdefaults.set(newValue, forKey: UserDefaultKey.togglWorkSpace.rawValue)
        }
    }
    
    var dev: String? {
        get {
            return userdefaults.string(forKey: UserDefaultKey.dev.rawValue)
        }
        set {
            userdefaults.set(newValue, forKey: UserDefaultKey.dev.rawValue)
        }
    }
    
    var name: String? {
        get {
            return userdefaults.string(forKey: UserDefaultKey.name.rawValue)
        }
        set {
            userdefaults.set(newValue, forKey: UserDefaultKey.name.rawValue)
        }
    }
    
    var outputMode: String? {
        get {
            return userdefaults.string(forKey: UserDefaultKey.outputMode.rawValue)
        }
        set {
            userdefaults.set(newValue, forKey: UserDefaultKey.outputMode.rawValue)
        }
    }
    
    func syncUserdefaults() {
        userdefaults.synchronize()
    }
}
