//
//  HomeStack.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import Foundation

//Home Screens Stack

enum HomeStack:String, CaseIterable{
    case myPosts = "My Posts"
    case oldPosts = "Old Posts"
    case latestPosts = "Latest Posts"
    case deletedPosts = "Deleted Posts"
    
    static func convert(from:String)->Self?{
        return self.allCases.first{ _case in
            _case.rawValue.lowercased() == from.lowercased()
        }
    }
}
