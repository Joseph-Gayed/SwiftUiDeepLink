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
    //    swiftuideeplink://tab=home&&nav=My Posts
    func handleDeepLink(link:String){
        print(link)
        
        //split link by "?"
        let components = link.replacingOccurrences(of: "swiftuideeplink://", with: "").components(separatedBy: "?")
        
        for component in components{
            //tab change request
            if component.contains("tab="){
                let tabRawValue = component.replacingOccurrences(of: "tab=", with: "")
                print(tabRawValue)

                if let requestedTab = Tab.convert(from: tabRawValue){
                    appData.activeTab = requestedTab
                }
            }
            
            //nav change request
            if component.contains("tab=") && component.contains("nav="){
                let tabRawValue = component
            }
            
        }
    }
}
