//
//  FavoritesStack.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import Foundation

//Favorites  Stack
enum FavoritesStack:String, CaseIterable{
    case joya = "Joya"
    case tia = "Tia"
    case sotir = "Sotir"
    
    static func convert(from:String)->Self?{
        return self.allCases.first{ _case in
            _case.rawValue.lowercased() == from.lowercased()
        }
    }
}
