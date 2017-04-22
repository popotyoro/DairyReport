//
//  PreferenceViewController.swift
//  DairyReport
//
//  Created by popota on 2017/04/15.
//  Copyright © 2017年 Popota. All rights reserved.
//

import Cocoa

class GlobalSettingsViewController: NSViewController {

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
        
        let userDefalutManager = UserdefaultsManager()
        togglApiKey.stringValue = userDefalutManager.togglApiLey ?? ""
        togglUserAgent.stringValue = userDefalutManager.togglUserAgent ?? ""
        togglWorkSpace.stringValue = userDefalutManager.togglWorkSpace ?? ""
        dev.stringValue = userDefalutManager.dev ?? ""
        name.stringValue = userDefalutManager.name ?? ""
    }
    
    private func savePreferences() {
        
        var userDefalutsManager = UserdefaultsManager()
        
        userDefalutsManager.togglApiLey = togglApiKey.stringValue
        userDefalutsManager.togglUserAgent = togglUserAgent.stringValue
        userDefalutsManager.togglWorkSpace = togglWorkSpace.stringValue
        userDefalutsManager.dev = dev.stringValue
        userDefalutsManager.name = name.stringValue
        
        userDefalutsManager.syncUserdefaults()
    }

    @IBAction func saveButtonDidPush(_ sender: NSButton) {
        savePreferences()
    }
}
