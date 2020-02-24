//
//  FullContinentList.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct FullContinentList: View {
    let api: Countries
    
    @GraphQL(Countries.continents)
    var continents: [ContinentCell.Continent?]?

    var body: some View {
        continents
            .compactMap { continents in
                List(continents, id: \.name) { continent in
                    ContinentCell(api: self.api, continent: continent)
                }.listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Continents")
    }
}
