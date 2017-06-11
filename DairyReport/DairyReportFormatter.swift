//
//  DairyReportFormatter.swift
//  DairyReport
//
//  Created by popota on 2017/04/15.
//  Copyright © 2017年 Popota. All rights reserved.
//

import Foundation

struct DairyReportFormtter {
    
    /// ■ project
    /// \t ● title
    /// \t - cost hh:mm
    /// \t\t ・ Note
    ///
    /// - Parameter models: togglModels
    /// - Returns: convetedString
    static func convertBody(fromModels models: TogglModel) -> String {
        
        var converted: String = ""
        
        models.value.forEach { (togglModel) in
            converted.append(String(format: NSLocalizedString("Body_Project", comment: ""), togglModel.key.description, togglModel.key.tags.joined(separator: ",")) + "\n")
            
            converted.append(String(format: NSLocalizedString("Body_Detail", comment: ""), togglModel.key.project, convertTomm(fromToggleCost: togglModel.value)) + "\n")
            
        }
        
        converted.append(NSLocalizedString("Body_Impression", comment: "") + "\n")
        
        return converted
    }
    
    
    /// 日報のメール件名を返す
    ///
    /// - Parameters:
    ///   - devName: 所属部所
    ///   - userName: UserName
    ///   - date: date
    /// - Returns: mailSubject
    static func convertMailSubject(from devName: String, userName: String, date: Date = Date()) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "M月dd日"
        
        return String(format: NSLocalizedString("MailSubject", comment: ""), formatter.string(from: date), devName, userName)
    }
    
    
    /// 日報のヘッダーを返す
    ///
    /// - Parameters:
    ///   - dev: 所属部所 ex.10
    ///   - name: なまえ
    /// - Returns: header
    static func convertHeader(dev: String, name: String) -> String {
     
        return String(format: NSLocalizedString("Header", comment: ""), dev, name)
    }
    
    
    /// Togglのcostをmm分形式にconvert
    ///
    /// - Parameter cost: togglCost:ms
    /// - Returns: mm分
    static func convertTomm(fromToggleCost cost: Int) -> String {
        return "\((cost / 1000 / 60).description)分"
    }
}
