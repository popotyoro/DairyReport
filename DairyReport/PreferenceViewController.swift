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
}

class PreferenceViewController: NSViewController {

    @IBOutlet weak var togglApiKey: NSTextField!
    @IBOutlet weak var togglUserAgent: NSTextField!
    @IBOutlet weak var togglWorkSpace: NSTextField!
    @IBOutlet weak var dev: NSTextField!
    @IBOutlet weak var name: NSTextField!
    
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
        
        
    }
    
    private func savePreferences() {
        let userdefaluts = UserDefaults.standard
        userdefaluts.set(togglApiKey.stringValue, forKey: UserDefaultKey.togglApiKey.rawValue)
        userdefaluts.set(togglUserAgent.stringValue, forKey: UserDefaultKey.togglUserAgent.rawValue)
        userdefaluts.set(togglWorkSpace.stringValue, forKey: UserDefaultKey.togglWorkSpace.rawValue)
        userdefaluts.set(dev.stringValue, forKey: UserDefaultKey.dev.rawValue)
        userdefaluts.set(name.stringValue, forKey: UserDefaultKey.name.rawValue)
        userdefaluts.synchronize()
    }

    @IBAction func saveButtonDidPush(_ sender: NSButton) {
        savePreferences()
    }
}
