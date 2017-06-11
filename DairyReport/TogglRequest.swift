//
//  TogglRequest.swift
//  DairyReport
//
//  Created by Popota on 2017/04/14.
//  Copyright © 2017年 Popota. All rights reserved.
//
import Foundation
import SwiftyJSON
import Alamofire

class TogglRequest {
    
    static let requestHeader = "api_token"
    
    struct TogglRequestParam {
        static let url: String = "https://toggl.com/reports/api/v2/details/"
    }
    
    static func requestTogglReport(date: Date, completionHandler: ((TogglModel) -> ())?) {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "YYYY-MM-dd"
        
        let paramerters: Parameters = ["workspace_id" : UserDefaults.standard.string(forKey: UserDefaultKey.togglWorkSpace.rawValue)!,
                                       "user_agent" : UserDefaults.standard.string(forKey: UserDefaultKey.togglUserAgent.rawValue)!,
                                       "since" : formatter.string(from: date),
                                       "until" : formatter.string(from: date)]
        
        let authStr = "\(UserDefaults.standard.string(forKey: UserDefaultKey.togglApiKey.rawValue)!):\(requestHeader)"
        let data = authStr.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let authData = data.base64EncodedString()
        let authValue = "Basic \(authData)"
        
        let headers: HTTPHeaders = [
            "Authorization": authValue
        ]
        
        var togglData: TogglModel = TogglModel(value: [:])
        
        Alamofire.request(TogglRequestParam.url, parameters: paramerters, headers: headers).responseJSON {
            response in
            debugPrint(response)
            guard let data = response.result.value else { return }
            let jsons = JSON(data)
            
            jsons["data"].forEach{(_, json) in
                
                let key = DairyReportDataKey(description: json["description"].stringValue,
                                             project: json["project"].stringValue,
                                             tags: json["tags"].arrayValue.map{$0.stringValue})
                
                if var value = togglData.value[key] {
                    value += json["dur"].intValue
                } else {
                    togglData.value[key] = json["dur"].intValue
                }
            }
            
            completionHandler?(togglData)
            
            debugPrint(togglData)
        }
    }
}
