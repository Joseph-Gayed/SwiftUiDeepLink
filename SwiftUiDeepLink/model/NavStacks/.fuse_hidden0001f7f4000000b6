//
//  SettingsStack.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import Foundation

//Settings Stack
enum SettingsStack:String, CaseIterable{
    case myProfile = "My Profile"
    case dataUsage = "Data Usage"
    case privacyPolicy = "Privacy Policy"
    case termsOfService = "Terms Of Service"
    
    static func convert(from:String)->Self?{
        return self.allCases.first{ _case in
            _case.rawValue.lowercased() == from.lowercased()
        }
    }
}
