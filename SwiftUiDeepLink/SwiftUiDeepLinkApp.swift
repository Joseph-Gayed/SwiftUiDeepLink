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
                    handleDeepLink(url: url)
                })
        }
    }
    
    //go to project settings , in the info tab , under the URL types section , check the the schema.
    //For changing the tab expected urls:
    //    swiftuideeplink://home
    //    swiftuideeplink://favorites
    //    swiftuideeplink://settings
    
    //For changing the navigation inside a tab expected urls:
    //    swiftuideeplink://home?nav=My_Posts
    //    swiftuideeplink://home?nav=Old_Posts
    //    swiftuideeplink://home?nav=Latest_Posts
    
    //    swiftuideeplink://favorites?nav=Joya
    //    swiftuideeplink://favorites?nav=Tia
    //    swiftuideeplink://favorites?nav=Sotir
    
    //    swiftuideeplink://settings?nav=My_Profile
    //    swiftuideeplink://settings?nav=Data_Usage
    //    swiftuideeplink://settings?nav=Privacy_Policy
    //    swiftuideeplink://settings?nav=Terms_Of_Service
    
    
  
    
    func handleDeepLink(url:URL){
        let link = url.absoluteString
        print(link)
        
        let urlComponents:URLComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) ?? URLComponents()
        let tabName:String = urlComponents.host ?? ""
        let queryParams:[String:String] = urlComponents.getQueryDictionary()
        
        navigate(tabName, queryParams)
    }
    
    
    fileprivate func navigate(_ tabName: String, _ queryParams: [String : String]) {
        //navigate to 1 of the tabs
        if let requestedTab = Tab.convert(from: tabName){
            print("tab: \(requestedTab.rawValue )")
            appData.activeTab = requestedTab
        }
        
        //navigate to 1 of the screens inside the opened tab
        if let requestedScreen = queryParams["nav"]?.replacingOccurrences(of: "_", with: " "){
            print("nav: "+requestedScreen)
            navigateToScreen(requestedScreen)
        }
    }
    
    fileprivate func navigateToScreen(_ requestedScreen: String) {
        switch appData.activeTab {
        case .home:
            if let navPath = HomeStack.convert(from: requestedScreen){
                appData.homeStack.append(navPath)
            }
            
        case .favorites:
            if let navPath = FavoritesStack.convert(from: requestedScreen){
                appData.favoritesStack.append(navPath)
            }
            
        case .settings:
            if let navPath = SettingsStack.convert(from: requestedScreen){
                appData.settingsStack.append(navPath)
            }
        }
    }
}


