//
//  VenezuelaView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 11/28/19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct VenezuelaView: View {
    let api: Countries

    @GraphQL(Countries.Query.country(code: .value("VE")))
    var country: CountryDetailView.Country?

    var body: some View {
        country.map { CountryDetailView(api: api, country: $0) }
    }
}
