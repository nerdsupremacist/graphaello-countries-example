//
//  CountryDetailBasicInfoView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 28.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryDetailBasicInfoView: View {
    @GraphQL(Countries.Country.name)
    var name: String? = nil
    
    @GraphQL(Countries.Country.native)
    var native: String? = nil
    
    @GraphQL(Countries.Country.code)
    var code: String? = nil
    
    @GraphQL(Countries.Country.emoji)
    var emoji: String? = nil
    
    @GraphQL(Countries.Country.phone)
    var phone: String? = nil
    
    @GraphQL(Countries.Country.currency)
    var currency: String? = nil
    
    var body: some View {
        Section(header: Text("Basic Info")) {
            name.map { CountryInfo(title: "Name", value: $0) }
            native.map { $0 != name ? CountryInfo(title: "Native Name", value: $0) : nil }
            code.map { CountryInfo(title: "ISO Code", value: $0) }
            emoji.map { CountryInfo(title: "Emoji", value: $0) }
            phone.map { CountryInfo(title: "Calling Code", value: "+\($0)") }
            currency.map { CountryInfo(title: "Currency", value: $0) }
        }
    }
}
