//
//  FavoritesScreen.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import SwiftUI

struct FavoritesScreen: View {
    
   var screenName: String
    var body: some View {
        Text("This is Favorites - \(screenName) Screen!")
    }
}

#Preview {
    FavoritesScreen(screenName:"Preview")
}
