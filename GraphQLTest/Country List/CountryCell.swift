//
//  CountryCell.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryCell: View {
    let api: Countries
    
    @GraphQL(Countries.Country.code)
    var code: String? = nil
    
    @GraphQL(Countries.Country.emoji)
    var emoji: String? = nil
    
    @GraphQL(Countries.Country.name)
    var name: String? = nil

    var body: some View {
        NavigationLink(destination: api.countryDetailsView(code: code)) {
            HStack {
                emoji.map { Text($0) }
                name.map { Text($0) }
            }
        }
    }
}
