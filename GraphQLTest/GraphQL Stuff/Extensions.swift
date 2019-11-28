//
//  Extensions.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 25.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import SwiftUI
import Apollo

extension CountryDetailView {
    typealias Country = CountryDetailViewCountry
    
    init(api: Countries, country: Country) {
        self.init(api: api,
                  name: country.name,
                  native: country.native,
                  code: country.code,
                  emoji: country.emoji,
                  phone: country.phone,
                  currency: country.currency,
                  continent: country.continent?.fragments.continentCellContinent,
                  languages: country.languages?.compactMap { $0?.fragments.languageCellLanguage })
    }
}

extension CountryCell {
    typealias Country = CountryCellCountry

    init(api: Countries, country: Country) {
        self.init(api: api,
                  code: country.code,
                  emoji: country.emoji,
                  name: country.name)
    }
}

extension CountryListForContinent {
    typealias Continent = CountryListForContinentContinent
    
    init(api: Countries, continent: Continent) {
        self.init(api: api,
                  name: continent.name,
                  countries: continent.countries?.compactMap { $0?.fragments.countryCellCountry })
    }
}

extension ContinentCell {
    typealias Continent = ContinentCellContinent
    
    init(api: Countries, continent: Continent) {
        self.init(api: api, code: continent.code, name: continent.name)
    }
}

extension LanguageCell {
    typealias Language = LanguageCellLanguage
    
    init(language: Language) {
        self.init(name: language.name)
    }
}

extension FullCountryList {
    typealias Data = FullCountryListQuery.Data
    
    init(api: Countries, data: Data) {
        self.init(api: api, countries: data.countries?.compactMap { $0?.fragments.countryCellCountry })
    }
}

extension Countries {
    
    func fullCountryList() -> some View {
        return QueryRenderer(client: client, query: FullCountryListQuery()) { FullCountryList(api: self, data: $0) }
    }
    
}

extension FullContinentList {
    typealias Data = FullContinentListQuery.Data
    
    init(api: Countries, data: Data) {
        self.init(api: api, continents: data.continents?.compactMap { $0?.fragments.continentCellContinent })
    }
}

extension Countries {
    
    func fullContinentList() -> some View {
        return QueryRenderer(client: client, query: FullContinentListQuery()) { data in
            FullContinentList(api: self, data: data)
        }
    }
    
}

extension FullLanguageList {
    typealias Data = FullLanguageListQuery.Data
    
    init(data: Data) {
        self.init(languages: data.languages?.compactMap { $0?.fragments.languageCellLanguage })
    }
}

extension Countries {
    
    func fullLanguageList() -> some View {
        return QueryRenderer(client: client, query: FullLanguageListQuery(), factory: FullLanguageList.init)
    }
    
}

extension CountryDetailsViewWrapper {
    typealias Data = CountryDetailsViewQuery.Data
    
    init(api: Countries, data: Data) {
        self.init(api: api, country: data.country?.fragments.countryDetailViewCountry)
    }
}

extension Countries {
    
    func countryDetailsView(code: String?) -> some View {
        return QueryRenderer(client: client,
                             query: CountryDetailsViewQuery(code: code)) { data in
            
            CountryDetailsViewWrapper(api: self, data: data)
        }
    }
    
}

extension CountryListForContinentWrapper {
    typealias Data = CountryListForContinentQuery.Data

    init(api: Countries, data: Data) {
        self.init(api: api, continent: data.continent?.fragments.countryListForContinentContinent)
    }
}

extension Countries {
    
    func countryListForContinent(code: String?) -> some View {
        return QueryRenderer(client: client,
                             query: CountryListForContinentQuery(code: code)) { data in
            
            CountryListForContinentWrapper(api: self, data: data)
        }
    }
    
}
