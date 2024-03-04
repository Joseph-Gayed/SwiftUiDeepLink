//
//  SwiftUiDeepLinkApp.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import SwiftUI

@main
struct SwiftUiDeepLinkApp: App {
    //State object contains whole app data , pass it via EnvironmentObject
    @State private var appData:AppData = .init()
    
    var body: some Scene {
        WindowGroup {
            AppContentView()
                .environmentObject(appData) //This allows all child views of AppContentView to access and observe changes to the appData object.
        }
    }
}
