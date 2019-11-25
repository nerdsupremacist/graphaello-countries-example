//
//  ContentView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 05.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct ContinentList: View {
    let continents: [BasicContinent]
    
    var body: some View {
        List(continents, id: \.code) { continent in
            ContinentCell(continent: continent)
        }.listStyle(GroupedListStyle())
    }
}
