//
//  ChangeModeViewController.swift
//  DairyReport
//
//  Created by popota on 2017/04/22.
//  Copyright © 2017年 鈴木 耕介. All rights reserved.
//

import Cocoa

class ChangeModeViewController: NSViewController {
    
    @IBOutlet weak var mailModeButton: NSButton!
    @IBOutlet weak var slackModeButton: NSButton!
    @IBOutlet var demoTextView: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // DEMO用なので編集不要
        demoTextView.isEditable = false
        setUpRadioButtonState()
        
    }
    
    private func setUpRadioButtonState() {
        
        let userDefaultsManager = UserdefaultsManager()
        
        guard let outputModeType = userDefaultsManager.outputMode else {
            return
        }
        
        switch outputModeType {
        case OutputModeType.mail.rawValue:
            mailModeButton.state = 1
            slackModeButton.state = 0
            
        case OutputModeType.slack.rawValue:
            mailModeButton.state = 0
            slackModeButton.state = 1
            
        default: break
            
        }
    }
    
    @IBAction func mailModeButtonDidPush(_ sender: NSButton) {
        mailModeButton.state = 1
        slackModeButton.state = 0
        
        var userDefaultsManager = UserdefaultsManager()
        userDefaultsManager.outputMode = OutputModeType.mail.rawValue
        userDefaultsManager.syncUserdefaults()
    }
    
    
    @IBAction func slackModeButtonDidPush(_ sender: NSButton) {
        mailModeButton.state = 0
        slackModeButton.state = 1
        
        var userDefaultsManager = UserdefaultsManager()
        userDefaultsManager.outputMode = OutputModeType.slack.rawValue
        userDefaultsManager.syncUserdefaults()
        
    }
    
}
