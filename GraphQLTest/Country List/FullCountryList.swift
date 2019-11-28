//
//  FullCountryListWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct FullCountryList: View {
    let api: Countries
    
    @GraphQL(Countries.Query.countries())
    var countries: [CountryCell.Country]? = nil
    
    var body: some View {
        countries
            .map { CountryList(api: api, countries: $0) }
            .navigationBarTitle("Countries")
    }
}
