//
//  PreferenceViewController.swift
//  DairyReport
//
//  Created by popota on 2017/04/15.
//  Copyright © 2017年 Popota. All rights reserved.
//

import Cocoa

enum UserDefaultKey: String {
    case togglApiKey = "togglApiKey"
    case togglUserAgent = "togglUserAgent"
    case togglWorkSpace = "togglWorkSpace"
    case dev = "dev"
    case name = "name"
    case slackApiKey = "slackApiKey"
    case slackChannel = "slackChannel"
}

class PreferenceViewController: NSViewController {

    @IBOutlet weak var togglApiKey: NSTextField!
    @IBOutlet weak var togglUserAgent: NSTextField!
    @IBOutlet weak var togglWorkSpace: NSTextField!
    
    @IBOutlet weak var dev: NSTextField!
    @IBOutlet weak var name: NSTextField!
    
    @IBOutlet weak var slackApiKey: NSTextField!
    @IBOutlet weak var slackChannel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        loadPreferences()
        
    }
    
    
    private func loadPreferences() {
        
        let userdefaults = UserDefaults.standard
        togglApiKey.stringValue = userdefaults.string(forKey: UserDefaultKey.togglApiKey.rawValue) ?? ""
        togglUserAgent.stringValue = userdefaults.string(forKey: UserDefaultKey.togglUserAgent.rawValue) ?? ""
        togglWorkSpace.stringValue = userdefaults.string(forKey: UserDefaultKey.togglWorkSpace.rawValue) ?? ""
        dev.stringValue = userdefaults.string(forKey: UserDefaultKey.dev.rawValue) ?? ""
        name.stringValue = userdefaults.string(forKey: UserDefaultKey.name.rawValue) ?? ""
        slackApiKey.stringValue = userdefaults.string(forKey: UserDefaultKey.slackApiKey.rawValue) ?? ""
        slackChannel.stringValue = userdefaults.string(forKey: UserDefaultKey.slackChannel.rawValue) ?? ""
        
        
    }
    
    private func savePreferences() {
        let userdefaluts = UserDefaults.standard
        userdefaluts.set(togglApiKey.stringValue, forKey: UserDefaultKey.togglApiKey.rawValue)
        userdefaluts.set(togglUserAgent.stringValue, forKey: UserDefaultKey.togglUserAgent.rawValue)
        userdefaluts.set(togglWorkSpace.stringValue, forKey: UserDefaultKey.togglWorkSpace.rawValue)
        userdefaluts.set(dev.stringValue, forKey: UserDefaultKey.dev.rawValue)
        userdefaluts.set(name.stringValue, forKey: UserDefaultKey.name.rawValue)
        userdefaluts.set(slackApiKey.stringValue, forKey: UserDefaultKey.slackApiKey.rawValue)
        userdefaluts.set(slackChannel.stringValue, forKey: UserDefaultKey.slackChannel.rawValue)
        userdefaluts.synchronize()
    }

    @IBAction func saveButtonDidPush(_ sender: NSButton) {
        savePreferences()
    }
}
