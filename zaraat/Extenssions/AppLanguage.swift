//
//  AppLanguage.swift
//  SevenZeroOne
//
//  Created by Apple on 1/22/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

class AppLanguage {
    static let shared = AppLanguage()


    // computed properties
    var isRTL: Bool {
        return   false //mydefaultLanguage == ar ? true:false
    }
}
