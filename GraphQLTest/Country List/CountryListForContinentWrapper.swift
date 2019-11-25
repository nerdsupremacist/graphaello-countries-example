//
//  CountryListByContinentWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryListForContinentWrapper: View {
    let continent: BasicContinent
    
    var navigationTitle: String {
        return continent.name ?? "Countries"
    }
    
    var body: some View {
        QueryRenderer(query: CountryByContinentListQuery(code: continent.code)) { data in
            CountryList(countries: data.continent?.countries?.compactMap { $0?.fragments.basicCountry } ?? [])
        }.navigationBarTitle(Text(navigationTitle), displayMode: .inline)
    }
}
