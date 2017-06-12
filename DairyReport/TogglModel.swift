//
//  TogglModel.swift
//  DairyReport
//
//  Created by Popota on 2017/04/14.
//  Copyright © 2017年 Popota. All rights reserved.
//

import Foundation

struct DairyReportDataKey: Hashable {
    var description: String
    var tags: [String]
    
    static func ==(lhs: DairyReportDataKey, rhs: DairyReportDataKey) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var hashValue: Int {
        return (description + tags.joined(separator: ",")).hashValue
    }
}

struct TogglModel {
    typealias ProjectName = String
    var value: Dictionary<ProjectName, Dictionary<DairyReportDataKey, Int>>
}
