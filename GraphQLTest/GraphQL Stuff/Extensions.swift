//
//  Extensions.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 25.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
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

extension CountryDetailsForBasicWrapper {
    typealias Country = CountryDetailsForBasicWrapperCountry

    init(country: Country) {
        self.init(code: country.code)
    }
}

extension CountryCell {
    typealias Country = CountryCellCountry

    init(country: Country) {
        self.init(detailsInfo: country.fragments.countryDetailsForBasicWrapperCountry,
                  emoji: country.emoji,
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
