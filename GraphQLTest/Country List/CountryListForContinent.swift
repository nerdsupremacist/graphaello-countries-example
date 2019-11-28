//
//  CountryListForContinent.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 28.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryListForContinent: View {
    let api: Countries
    
    @GraphQL(Countries.Continent.name)
    var name: String? = nil
    
    @GraphQL(Countries.Continent.countries())
    var countries: [CountryCell.Country]? = nil
    
    var navigationTitle: String {
        return name ?? "Countries"
    }
    
    var body: some View {
        countries
            .map { CountryList(api: api, countries: $0) }
            .navigationBarTitle(Text(navigationTitle), displayMode: .inline)
    }
}
