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
        
    }
    
}
