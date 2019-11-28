//
//  CountryListForContinent.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 28.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryListForContinent: View {
    @Countries.Continent.Name var name: String?
    @Countries.Continent.Countries var countries: [CountryCell.Country]?
    
    var navigationTitle: String {
        return name ?? "Countries"
    }
    
    var body: some View {
        countries.map(CountryList.init).navigationBarTitle(Text(navigationTitle), displayMode: .inline)
    }
}
