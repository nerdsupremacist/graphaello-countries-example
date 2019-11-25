//
//  CountryDetailView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    let country: CountryDetails
    
    var body: some View {
        List {
            Section(header: Text("Basic Info")) {
                country.name.map { CountryInfo(title: "Name", value: $0) }
                country.native.map { $0 != country.name ? CountryInfo(title: "Native Name", value: $0) : nil }
                country.code.map { CountryInfo(title: "ISO Code", value: $0) }
                country.emoji.map { CountryInfo(title: "Emoji", value: $0) }
                country.phone.map { CountryInfo(title: "Calling Code", value: "+\($0)") }
                country.currency.map { CountryInfo(title: "Currency", value: $0) }
            }
            
            country.continent.map { continent in
                Section(header: Text("Continent")) {
                    ContinentCell(continent: continent.fragments.basicContinent)
                }
            }
            
            country.languages.flatMap { languages in
                !languages.isEmpty ? Section(header: Text("Languages")) {
                    ForEach(languages.compactMap { $0?.fragments.basicLanguage }, id: \BasicLanguage.code) { language in
                        LanguageCell(language: language)
                    }
                } : nil
            }
            
            country.name
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
        }.listStyle(GroupedListStyle()).navigationBarTitle(Text(country.name ?? "Country"), displayMode: .inline)
    }
}
