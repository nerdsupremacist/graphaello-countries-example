//
//  CountryList.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryList: View {
    let countries: [BasicCountry]
    
    var body: some View {
        List(countries, id: \.code) { country in
            CountryCell(country: country)
        }.listStyle(GroupedListStyle())
    }
}
