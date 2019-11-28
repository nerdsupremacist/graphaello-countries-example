//
//  ContinentCell.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct ContinentCell: View {
    let api: Countries
    
    @GraphQL(Countries.Continent.code)
    var code: String? = nil
    
    @GraphQL(Countries.Continent.name)
    var name: String? = nil
    
    var body: some View {
        NavigationLink(destination: api.countryListForContinent(code: code)) {
            HStack {
                name.map { Text($0) }
            }
        }
    }
}
