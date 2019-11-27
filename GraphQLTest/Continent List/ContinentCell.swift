//
//  ContinentCell.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct ContinentCell: View {
    @Countries.Continent.Fragment var countryList: CountryListForContinentWrapper.Continent
    @Countries.Continent.Name var name: String?
    
    var body: some View {
        NavigationLink(destination: CountryListForContinentWrapper(continent: countryList)) {
            HStack {
                name.map { Text($0) }
            }
        }
    }
}
