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
    
    @Countries.Country.Code
    var code: String?
    
    @Countries.Country.Emoji
    var emoji: String?
    
    @Countries.Country.Name
    var name: String?

    var body: some View {
        NavigationLink(destination: api.countryDetailsView(code: code)) {
            HStack {
                emoji.map { Text($0) }
                name.map { Text($0) }
            }
        }
    }
}
