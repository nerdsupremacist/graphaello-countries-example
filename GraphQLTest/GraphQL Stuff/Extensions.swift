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
    
    init(country: Country) {
        self.init(name: country.name,
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

    init(country: Country) {
        self.init(emoji: country.emoji,
                  name: country.name)
    }
}

extension CountryListForContinent {
    typealias Continent = CountryListForContinentContinent
    
    init(continent: Continent) {
        self.init(name: continent.name, countries: continent.countries?.compactMap { $0?.fragments.countryCellCountry })
    }
}

extension ContinentCell {
    typealias Continent = ContinentCellContinent
    
    init(continent: Continent) {
        self.init(name: continent.name)
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
    
    init(data: Data) {
        self.init(countries: data.countries?.compactMap { $0?.fragments.countryCellCountry })
    }
}

extension Countries {
    
    func fullCountryList() -> some View {
        return QueryRenderer(client: client, query: FullCountryListQuery(), factory: FullCountryList.init)
    }
    
}

extension FullContinentList {
    typealias Data = FullContinentListQuery.Data
    
    init(data: Data) {
        self.init(continents: data.continents?.compactMap { $0?.fragments.continentCellContinent })
    }
}

extension Countries {
    
    func fullContinentList() -> some View {
        return QueryRenderer(client: client, query: FullContinentListQuery(), factory: FullContinentList.init)
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
    
    init(data: Data) {
        self.init(country: data.country?.fragments.countryDetailViewCountry)
    }
}

extension Countries {
    
    func countryDetailsView(code: String?) -> some View {
        return QueryRenderer(client: client, query: CountryDetailsViewQuery(code: code), factory: CountryDetailsViewWrapper.init)
    }
    
}

extension CountryListForContinentWrapper {
    typealias Data = CountryListForContinentQuery.Data

    init(data: Data) {
        self.init(continent: data.continent?.fragments.countryListForContinentContinent)
    }
}
