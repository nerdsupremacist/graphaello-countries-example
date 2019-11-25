//
//  CountryCell.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryCell: View {
    let country: BasicCountry
    
    var body: some View {
        NavigationLink(destination: CountryDetailsForBasicWrapper(country: country)) {
            HStack {
                country.emoji.map { Text($0) }
                country.name.map { Text($0) }
            }
        }
    }
}
