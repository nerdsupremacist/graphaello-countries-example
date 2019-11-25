//
//  CountryDetailView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    @Countries.Country private(set) var name: String?
    @Countries.Country private(set) var native: String?
    @Countries.Country private(set) var code: String?
    @Countries.Country private(set) var emoji: String?
    @Countries.Country private(set) var phone: String?
    @Countries.Country private(set) var currency: String?
    @Countries.Country private(set) var continent: ContinentCell.Continent?
    @Countries.Country private(set) var languages: [LanguageCell.Language]?
    
    var body: some View {
        List {
            Section(header: Text("Basic Info")) {
                name.map { CountryInfo(title: "Name", value: $0) }
                native.map { $0 != name ? CountryInfo(title: "Native Name", value: $0) : nil }
                code.map { CountryInfo(title: "ISO Code", value: $0) }
                emoji.map { CountryInfo(title: "Emoji", value: $0) }
                phone.map { CountryInfo(title: "Calling Code", value: "+\($0)") }
                currency.map { CountryInfo(title: "Currency", value: $0) }
            }
            
            continent.map { continent in
                Section(header: Text("Continent")) {
                    ContinentCell(continent: continent)
                }
            }
            
            languages.flatMap { languages in
                !languages.isEmpty ? Section(header: Text("Languages")) {
                    ForEach(languages, id: \.code) { language in
                        LanguageCell(language: language)
                    }
                } : nil
            }
            
            name
                .flatMap { $0.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) }
                .flatMap { URL(string: "https://en.wikipedia.org/wiki/\($0)") }
                .map { url in
                    Section {
                        Button(action: {
                            UIApplication.shared.open(url)
                        }) {
                            HStack(alignment: .center) {
                                Text("More Info")
                            }
                        }
                    }
            }
        }.listStyle(GroupedListStyle()).navigationBarTitle(Text(name ?? "Country"), displayMode: .inline)
    }
}
