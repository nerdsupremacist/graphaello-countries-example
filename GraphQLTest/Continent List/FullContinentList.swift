//
//  ContinentListWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct FullContinentList: View {
    let api: Countries
    
    @GraphQL(Countries.Query.continents)
    var continents: [ContinentCell.Continent]?

    var body: some View {
        continents
            .map { ContinentList(api: api, continents: $0) }
            .navigationBarTitle("Continents")
    }
}
