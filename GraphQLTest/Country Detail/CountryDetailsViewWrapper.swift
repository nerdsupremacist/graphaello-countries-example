//
//  CountryDetailsForBasicWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryDetailsViewWrapper: View {
    @Countries.Query.Country
    var country: CountryDetailView.Country?

    var body: some View {
        country.map(CountryDetailView.init)
    }
}
