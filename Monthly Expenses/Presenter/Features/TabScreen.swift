//
//  TabScreen.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 01/11/23.
//

import SwiftUI
import Alamofire

struct TabScreen: View {
    var request: DataRequest
    
    var body: some View {
        TabView {
            TestingTheory().tabItem { Label(
                title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
                icon: { /*@START_MENU_TOKEN@*/Image(systemName: "42.circle")/*@END_MENU_TOKEN@*/ }
            ) }
            
            Color.green.tabItem { Label(
                title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
                icon: { /*@START_MENU_TOKEN@*/Image(systemName: "42.circle")/*@END_MENU_TOKEN@*/ }
            )  }
            
            Color.blue.tabItem { Label(
                title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
                icon: { /*@START_MENU_TOKEN@*/Image(systemName: "42.circle")/*@END_MENU_TOKEN@*/ }
            )  }
            
            NavigationLink(destination: {
                TabScreen(request: AF.request("https://httpbin.org/get", interceptor: .retryPolicy))
            }, label: {
                Text("VAI!") // SHOWN IF NOT TAB ITEM
            }).tabItem { Label(
                title: { Text("GO!") },
                icon: { /*@START_MENU_TOKEN@*/Image(systemName: "42.circle")/*@END_MENU_TOKEN@*/ }
            ) }
            
        }
        
    }
}

#Preview {
    TabScreen(request: AF.request("https://httpbin.org/get", interceptor: .retryPolicy))
}
