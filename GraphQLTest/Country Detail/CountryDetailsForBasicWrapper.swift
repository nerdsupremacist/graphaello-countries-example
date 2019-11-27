//
//  CountryDetailsForBasicWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryDetailsForBasicWrapper: View {
    @Countries.Country.Code var code: String?

    var body: some View {
        code.map {
            QueryRenderer(query: CountryDetailsForCodeQuery(code: $0)) { data in
                data.country.map { CountryDetailView(country: $0.fragments.countryDetailViewCountry) }
            }
        }
    }
}
