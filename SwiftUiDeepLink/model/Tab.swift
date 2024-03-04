//
//  Tab.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import Foundation
// CaseIterable automatically generates a collection of all the cases defined within an enumeration.
// When a type conforms to CaseIterable, the compiler automatically generates a static property called allCases,
// which is an array containing all the cases of the enumeration in the order they are defined.

enum Tab: String , CaseIterable{
    case home = "Home"
    case favorites = "Favorites"
    case settings = "Settings"
    
    //computed property
    var icon:String{
        switch self {
        case .home:
            return "house.fill"
        case .favorites:
            return "heart.fill"
        case .settings:
            return "gear"
        }
    }
    
    //Self (Capital 'S') means the type of the Current Enum which Is Tab
    static func convert(from:String)-> Self?{
        return Tab.allCases.first{ tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
