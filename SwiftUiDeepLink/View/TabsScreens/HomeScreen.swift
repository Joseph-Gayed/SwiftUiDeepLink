//
//  HomeScreen.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import SwiftUI

struct HomeScreen: View {
    var screenName: String
    var body: some View {
        Text("This is Home - \(screenName) Screen!")
    }
}

#Preview {
    HomeScreen(screenName:"Preview")
}
