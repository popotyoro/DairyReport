//
//  TogglModel.swift
//  DairyReport
//
//  Created by Popota on 2017/04/14.
//  Copyright © 2017年 Popota. All rights reserved.
//

import Foundation

struct TogglModel {
    var project: String
    var detail: [ProjectDetail]
}

struct ProjectDetail {
    var title: String
    var cost: Int
}
