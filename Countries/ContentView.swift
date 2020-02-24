//
//  ContentView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let api: Countries
    
    var body: some View {
        TabView {
            NavigationView {
                api.fullCountryList()
            }.tabItem {
                Image(systemName: "flag.fill")
                Text("Countries")
            }
            
            NavigationView {
                api.fullContinentList()
            }.tabItem {
                Image(systemName: "map.fill")
                Text("Continents")
            }
            
            NavigationView {
                api.fullLanguageList()
            }.tabItem {
                Image(systemName: "speaker.3.fill")
                Text("Languages")
            }

            NavigationView {
                api.countryDetailView(code: "VE")
            }.tabItem {
                Image(systemName: "person.crop.circle")
                Text("My Country")
            }
        }.edgesIgnoringSafeArea(.top)
    }
}
