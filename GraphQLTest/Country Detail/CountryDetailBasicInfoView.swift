//
//  CountryDetailBasicInfoView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 28.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryDetailBasicInfoView: View {
    @Countries.Country.Name var name: String?
    @Countries.Country.Native var native: String?
    @Countries.Country.Code var code: String?
    @Countries.Country.Emoji var emoji: String?
    @Countries.Country.Phone var phone: String?
    @Countries.Country.Currency var currency: String?
    
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
