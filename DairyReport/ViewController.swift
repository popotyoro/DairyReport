//
//  ViewController.swift
//  DairyReport
//
//  Created by Popota on 2017/04/14.
//  Copyright © 2017年 Popota. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var togglDate: NSDatePicker!
    @IBOutlet weak var _textField: NSTextField!
    @IBOutlet weak var outputType: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChange(_:)), name: UserDefaults.didChangeNotification, object: nil)
        
        togglDate.dateValue = Date()
        
        guard let apiKey = UserDefaults.standard.string(forKey: UserDefaultKey.togglApiKey.rawValue), !apiKey.isEmpty else {
            return
        }

        TogglRequest.requestTogglReport(date: togglDate.dateValue, completionHandler: refreshTextFiled(togglData:))
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        if let outputMode = UserdefaultsManager().outputMode {
            outputType.stringValue = outputMode + "mode"
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UserDefaults.didChangeNotification, object: nil)
    }
    
    func refreshTextFiled(togglData: [TogglModel]) {
        
        let userdefaultsManager = UserdefaultsManager()
        
        _textField.stringValue = userdefaultsManager.outputMode == OutputModeType.mail.rawValue ? mailTypeText(togglData: togglData) : slackTypeText(togglData: togglData)
    }
    
    private func mailTypeText(togglData: [TogglModel]) -> String {
        
        let header = DairyReportFormtter.convertHeader(dev: (UserDefaults.standard.string(forKey: UserDefaultKey.dev.rawValue) ?? ""),
                                                       name: (UserDefaults.standard.string(forKey: UserDefaultKey.name.rawValue) ?? "")) + "\n\n"
        
        let body = DairyReportFormtter.convertBody(fromModels: togglData) + "\n"
        
        let fotter = NSLocalizedString("Fotter", comment: "")
        
        return header + body + fotter
        
    }
    
    private func slackTypeText(togglData: [TogglModel]) -> String {
        return DairyReportFormtter.convertBody(fromModels: togglData)
    }
    
    // MARK: IBAction - UIButton Event
    @IBAction func dairyReportButtonDidPush(_ sender: NSButton) {
        
        guard let apiKey = UserDefaults.standard.string(forKey: UserDefaultKey.togglApiKey.rawValue), !apiKey.isEmpty else {
            let alert = NSAlert()
            alert.messageText = "Please set your Toggl API Key 🙇"
            alert.runModal()
            return
        }
        
        TogglRequest.requestTogglReport(date: togglDate.dateValue, completionHandler: refreshTextFiled(togglData:))
    }
    
    // MARK: NotificationCenter - Userdefaluts
    func userDefaultsDidChange(_ notification: Notification) {
        if let outputMode = UserdefaultsManager().outputMode {
            outputType.stringValue = outputMode + "mode"
        }
    }

}

