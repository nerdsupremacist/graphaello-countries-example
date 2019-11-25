//
//  CountryListByContinentWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryListForContinentWrapper: View {
    @Countries.Continent var code: String?
    @Countries.Continent var name: String?
    
    var navigationTitle: String {
        return name ?? "Countries"
    }
    
    var body: some View {
        QueryRenderer(client: client, query: CountryByContinentListQuery(code: code)) { data in
            CountryList(countries: data.continent?.countries?.compactMap { $0?.fragments.countryCellCountry } ?? [])
        }.navigationBarTitle(Text(navigationTitle), displayMode: .inline)
    }
}
