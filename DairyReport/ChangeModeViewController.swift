//
//  ChangeModeViewController.swift
//  DairyReport
//
//  Created by popota on 2017/04/22.
//  Copyright © 2017年 popota. All rights reserved.
//

import Cocoa

class ChangeModeViewController: NSViewController {
    
    @IBOutlet weak var mailModeButton: NSButton!
    @IBOutlet weak var slackModeButton: NSButton!
    @IBOutlet var demoTextView: NSTextView!
    
    private let demoOutputTextMail = NSLocalizedString("Header", comment: "")
        + "\n"
        + String(format: NSLocalizedString("Body_Project", comment: ""), "Project名") + "\n"
        + String(format: NSLocalizedString("Body_Detail", comment: ""), "Title", "Subject") + "\n"
        + NSLocalizedString("Body_Impression", comment: "") + "\n"
        + NSLocalizedString("Fotter", comment: "")
    
    private let demoOutputTextSlack = String(format: NSLocalizedString("Body_Project", comment: ""), "Project名") + "\n"
        + String(format: NSLocalizedString("Body_Detail", comment: ""), "Title", "Subject") + "\n"
        + NSLocalizedString("Body_Impression", comment: "") + "\n"

    override func viewDidLoad() {
        super.viewDidLoad()
        // DEMO用なので編集不要
        demoTextView.isEditable = false
        setUpRadioButtonState()
        
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        setUpDemoTextView()
    }
    
    // MARK: Private Method
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
    
    private func setUpDemoTextView() {
        if mailModeButton.state == 1 {
            demoTextView.string = demoOutputTextMail
        } else {
            demoTextView.string = demoOutputTextSlack
        }
    }
    
    // MARK: IBAction Button Tap Event
    @IBAction func mailModeButtonDidPush(_ sender: NSButton) {
        mailModeButton.state = 1
        slackModeButton.state = 0
        
        var userDefaultsManager = UserdefaultsManager()
        userDefaultsManager.outputMode = OutputModeType.mail.rawValue
        userDefaultsManager.syncUserdefaults()
        
        // DemoViewを更新
        setUpDemoTextView()
        
    }
    
    @IBAction func slackModeButtonDidPush(_ sender: NSButton) {
        mailModeButton.state = 0
        slackModeButton.state = 1
        
        var userDefaultsManager = UserdefaultsManager()
        userDefaultsManager.outputMode = OutputModeType.slack.rawValue
        userDefaultsManager.syncUserdefaults()
        
        // DemoViewを更新
        setUpDemoTextView()
        
    }
    
}
