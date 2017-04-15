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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        togglDate.dateValue = Date()
        
        guard let apiKey = UserDefaults.standard.string(forKey: UserDefaultKey.togglApiKey.rawValue), !apiKey.isEmpty else {
            return
        }

        TogglRequest.requestTogglReport(date: togglDate.dateValue, completionHandler: refreshTextFiled(togglData:))
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func refreshTextFiled(togglData: [TogglModel]) {
        let header = DairyReportFormtter.convertHeader(dev: (UserDefaults.standard.string(forKey: UserDefaultKey.dev.rawValue) ?? ""),
                                                       name: (UserDefaults.standard.string(forKey: UserDefaultKey.name.rawValue) ?? "")) + "\n\n"
        
        let body = DairyReportFormtter.convertBody(fromModels: togglData) + "\n"
        
        let fotter = NSLocalizedString("Fotter", comment: "")
        
        _textField.stringValue = header + body + fotter
    }
    
    @IBAction func dairyReportButtonDidPush(_ sender: NSButton) {
        
        guard let _ = UserDefaults.standard.string(forKey: UserDefaultKey.togglApiKey.rawValue) else {
            let alert = NSAlert()
            alert.messageText = "Please set your Toggl API Key 🙇"
            alert.runModal()
            return
        }
        
        TogglRequest.requestTogglReport(date: togglDate.dateValue, completionHandler: refreshTextFiled(togglData:))
    }

}

