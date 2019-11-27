//
//  ContentView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                FullCountryList()
            }.tabItem {
                Image(systemName: "flag.fill")
                Text("Countries")
            }
            
            NavigationView {
                FullContinentList()
            }.tabItem {
                Image(systemName: "map.fill")
                Text("Continents")
            }
            
            NavigationView {
                LanguageListWrapper()
            }.tabItem {
                Image(systemName: "speaker.3.fill")
                Text("Languages")
            }
        }.edgesIgnoringSafeArea(.top)
    }
}
