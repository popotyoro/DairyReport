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
    var project: String
    var tags: [String]
    
    static func ==(lhs: DairyReportDataKey, rhs: DairyReportDataKey) -> Bool {
        return lhs.description == rhs.description
    }
    
    var hashValue: Int {
        return (description + project + tags.joined(separator: ",")).hashValue
    }
}

struct TogglModel {
    var value: Dictionary<DairyReportDataKey, Int>
}
