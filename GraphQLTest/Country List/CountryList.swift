//
//  CountryList.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryList: View {
    let api: Countries
    let countries: [CountryCell.Country]

    var body: some View {
        List(countries, id: \.name) { country in
            CountryCell(api: self.api, country: country)
        }.listStyle(GroupedListStyle())
    }
}
