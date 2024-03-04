//
//  AppData.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import Foundation

// This class inherits from ObservableObject, which means it can publish changes to its properties,
// allowing SwiftUI views to reactively update when those properties change
class AppData: ObservableObject {
    @Published var activeTab:Tab = .home
    @Published var homeStack:[HomeStack] = []
    @Published var favoritesStack:[FavoritesStack] = []
    @Published var settingsStack:[SettingsStack] = []
}
