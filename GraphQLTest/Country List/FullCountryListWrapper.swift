//
//  FullCountryListWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct FullCountryListWrapper: View {
    var body: some View {
        QueryRenderer(query: FullCountryListQuery()) { data in
            CountryList(countries: data.countries?.compactMap { $0?.fragments.countryCellCountry } ?? [])
        }.navigationBarTitle("Countries")
    }
}
