//
//  SettingsScreen.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import SwiftUI

struct SettingsScreen: View {
     var screenName: String
    var body: some View {
        Text("This is Settings - \(screenName) Screen!")
    }
}

#Preview {
    SettingsScreen(screenName:"Preview")
}
