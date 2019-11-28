//
//  CountryDetailsForBasicWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryDetailsViewWrapper: View {
    let api: Countries
    @Countries.Query.Country
    var country: CountryDetailView.Country?

    var body: some View {
        country.map { CountryDetailView(api: api, country: $0) }
    }
}
