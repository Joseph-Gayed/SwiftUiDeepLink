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
                //This allows all child views of AppContentView to access and observe changes to the appData object.
                .environmentObject(appData)
                
                //This will be called when deep link was triggered
                .onOpenURL(perform: { url in
                    handleDeepLink(link: url.absoluteString)
                })
        }
    }
    
    //go to project settings , in the info tab , under the URL types section , check the the schema.
    //For changing the tab expected urls:
    //    swiftuideeplink://tab=home
    //    swiftuideeplink://tab=favorites
    //    swiftuideeplink://tab=settings
    
    //For changing the navigation inside a tab expected urls:
    //    swiftuideeplink://tab=home?nav=My_Posts
    //    swiftuideeplink://tab=home?nav=Old_Posts
    //    swiftuideeplink://tab=home?nav=Latest_Posts
    
    //    swiftuideeplink://tab=favorites?nav=Joya
    //    swiftuideeplink://tab=favorites?nav=Tia
    //    swiftuideeplink://tab=favorites?nav=Sotir
    
    //    swiftuideeplink://tab=settings?nav=My_Profile
    //    swiftuideeplink://tab=settings?nav=Data_Usage
    //    swiftuideeplink://tab=settings?nav=Privacy_Policy
    //    swiftuideeplink://tab=settings?nav=Terms_Of_Service
    
    func handleDeepLink(link:String){
        print(link)
        
        //split link by "?"
        let components = link.replacingOccurrences(of: "swiftuideeplink://", with: "").components(separatedBy: "?")
        
        for component in components{
            //tab change request
            if component.contains("tab="){
                let tabRawValue = component.replacingOccurrences(of: "tab=", with: "")
                print("tab: "+tabRawValue)

                if let requestedTab = Tab.convert(from: tabRawValue){
                    appData.activeTab = requestedTab
                }
            }
            
            //nav change request
            if component.contains("nav="){
                let requestedNavPath = component
                    .replacingOccurrences(of: "tab=", with: "")
                    .replacingOccurrences(of: "nav=", with: "")
                    .replacingOccurrences(of: "_", with: " ")//_ represents space
                
                print("path: "+requestedNavPath)

                switch appData.activeTab {
                case .home:
                    if let navPath = HomeStack.convert(from: requestedNavPath){
                        appData.homeStack.append(navPath)
                    }
                
                case .favorites:
                    if let navPath = FavoritesStack.convert(from: requestedNavPath){
                        appData.favoritesStack.append(navPath)
                    }
                
                case .settings:
                    if let navPath = SettingsStack.convert(from: requestedNavPath){
                        appData.settingsStack.append(navPath)
                    }
                }
            }
            
        }
    }
}
