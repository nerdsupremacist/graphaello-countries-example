// This file will be autogenerated in the future and should not be edited

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

extension CountryDetailBasicInfoView {
    typealias Country = CountryDetailBasicInfoViewCountry
    
    init(country: Country) {
        self.init(name: GraphQL(country.name),
                  native: GraphQL(country.native),
                  code: GraphQL(country.code),
                  emoji: GraphQL(country.emoji),
                  phone: GraphQL(country.phone),
                  currency: GraphQL(country.currency))
    }
}

extension CountryDetailBasicInfoView.Country : CountriesCountryFragment { }

extension CountryDetailView {
    typealias Country = CountryDetailViewCountry
    
    init(api: Countries, country: Country) {
        self.init(api: api,
                  basicInfo: country.fragments.countryDetailBasicInfoViewCountry,
                  name: GraphQL(country.name),
                  continent: GraphQL(country.continent?.fragments.continentCellContinent),
                  languages: GraphQL(country.languages?.compactMap { $0?.fragments.languageCellLanguage }))
    }
}

extension CountryDetailView.Country : CountriesCountryFragment { }

extension CountryCell {
    typealias Country = CountryCellCountry

    init(api: Countries, country: Country) {
        self.init(api: api,
                  code: GraphQL(country.code),
                  emoji: GraphQL(country.emoji),
                  name: GraphQL(country.name))
    }
}

extension CountryCell.Country : CountriesCountryFragment { }

extension CountryListForContinent {
    typealias Continent = CountryListForContinentContinent
    
    init(api: Countries, continent: Continent) {
        self.init(api: api,
                  name: GraphQL(continent.name),
                  countries: GraphQL(continent.countries?.compactMap { $0?.fragments.countryCellCountry }))
    }
}

extension CountryListForContinent.Continent : CountriesContinentFragment { }

extension ContinentCell {
    typealias Continent = ContinentCellContinent
    
    init(api: Countries, continent: Continent) {
        self.init(api: api, code: GraphQL(continent.code), name: GraphQL(continent.name))
    }
}

extension ContinentCell.Continent : CountriesContinentFragment { }

extension LanguageCell {
    typealias Language = LanguageCellLanguage
    
    init(language: Language) {
        self.init(name: GraphQL(language.name))
    }
}

extension LanguageCell.Language : CountriesLanguageFragment { }

extension FullCountryList {
    typealias Data = FullCountryListQuery.Data
    
    init(api: Countries, data: Data) {
        self.init(api: api, countries: GraphQL(data.countries?.compactMap { $0?.fragments.countryCellCountry }))
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
        self.init(api: api, continents: GraphQL(data.continents?.compactMap { $0?.fragments.continentCellContinent }))
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
        self.init(languages: GraphQL(data.languages?.compactMap { $0?.fragments.languageCellLanguage }))
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
        self.init(api: api, country: GraphQL(data.country?.fragments.countryDetailViewCountry))
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
        self.init(api: api, continent: GraphQL(data.continent?.fragments.countryListForContinentContinent))
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

extension GraphQL {

    fileprivate init(_ value: Value) {
        self.init(wrappedValue: value, GraphQLPath())
    }

}
