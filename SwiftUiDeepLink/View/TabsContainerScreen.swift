//
//  TabsContainerScreen.swift
//  SwiftUiDeepLink
//
//  Created by Jo on 04/03/2024.
//

import SwiftUI

struct TabsContainerScreen: View {
    @EnvironmentObject
    private var appData:AppData
    
    var body: some View {
        TabView(selection: $appData.activeTab){
            HomeView()
                .tag(Tab.home)
                .tabItem { Image(systemName: Tab.home.icon) }
            
            FavoritesView()
                .tag(Tab.favorites)
                .tabItem { Image(systemName: Tab.favorites.icon) }
            
            SettingsView()
                .tag(Tab.settings)
                .tabItem { Image(systemName: Tab.settings.icon) }
        }
        .tint(.red)
    }
    
    
    
    @ViewBuilder
    func HomeView()->some View{
        NavigationStack(path: $appData.homeStack){
            List{
                ForEach(HomeStack.allCases,id:\.rawValue){ link in
                    NavigationLink(value:link){
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomeStack.self) { link in
                HomeScreen(screenName: link.rawValue)
            }
        }
    }
    
    
    @ViewBuilder
    func FavoritesView()->some View{
        NavigationStack(path: $appData.favoritesStack){
            List{
                ForEach(FavoritesStack.allCases,id:\.rawValue){ link in
                    NavigationLink(value:link){
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationDestination(for: FavoritesStack.self) { link in
                FavoritesScreen(screenName: link.rawValue)
            }
        }
    }
    
    @ViewBuilder
    func SettingsView()->some View{
        NavigationStack(path: $appData.settingsStack){
            List{
                ForEach(SettingsStack.allCases,id:\.rawValue){ link in
                    NavigationLink(value:link){
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationDestination(for: SettingsStack.self) { link in
                SettingsScreen(screenName: link.rawValue)
            }
        }
    }
}



#Preview {
    TabsContainerScreen().environmentObject(
        AppData()
    )
}
