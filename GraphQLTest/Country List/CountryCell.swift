//
//  CountryCell.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryCell: View {
    @Countries.Country.Fragment var detailsInfo: CountryDetailsForBasicWrapper.Country
    @Countries.Country.Emoji var emoji: String?
    @Countries.Country.Name var name: String?

    var body: some View {
//        NavigationLink(destination: CountryDetailsForBasicWrapper(country: detailsInfo)) {
            HStack {
                emoji.map { Text($0) }
                name.map { Text($0) }
            }
//        }
    }
}
