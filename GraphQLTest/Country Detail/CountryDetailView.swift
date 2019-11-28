//
//  CountryDetailView.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    let api: Countries
    
    @Countries.Country.Fragment
    var basicInfo: CountryDetailBasicInfoView.Country
    
    @Countries.Country.Name
    var name: String?
    
    @Countries.Country.Continent
    var continent: ContinentCell.Continent?
    
    @Countries.Country.Languages
    var languages: [LanguageCell.Language]?

    var body: some View {
        List {
            CountryDetailBasicInfoView(country: basicInfo)
            
            continent.map { continent in
                Section(header: Text("Continent")) {
                    ContinentCell(api: api, continent: continent)
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
