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

extension CountryListForContinentWrapper {
    typealias Continent = CountryListForContinentWrapperContinent

    init(continent: Continent) {
        self.init(code: continent.code, name: continent.code)
    }
}

extension ContinentCell {
    typealias Continent = ContinentCellContinent
    
    init(continent: Continent) {
        self.init(countryList: continent.fragments.countryListForContinentWrapperContinent,
                  name: continent.name)
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
        return QueryRenderer(query: FullCountryListQuery(), factory: FullCountryList.init)
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
        return QueryRenderer(query: FullContinentListQuery(), factory: FullContinentList.init)
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
        return QueryRenderer(query: FullLanguageListQuery(), factory: FullLanguageList.init)
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
        return QueryRenderer(query: CountryDetailsViewQuery(code: code), factory: CountryDetailsViewWrapper.init)
    }
    
}
