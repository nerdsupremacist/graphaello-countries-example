// swiftlint:disable all
// This file was automatically generated and should not be edited.

import Apollo
import Foundation
import SwiftUI

private struct QueryRenderer<Query: GraphQLQuery, Content: View>: View {
    typealias ContentFactory = (Query.Data) -> Content

    let client: ApolloClient
    let query: Query
    let factory: ContentFactory

    @State private var isLoading: Bool = false
    @State private var value: Query.Data? = nil
    @State private var error: String? = nil
    @State private var cancellable: Cancellable? = nil

    var body: some View {
        return VStack {
            error.map { Text("Error: \($0)") }
            value.map(factory)
            isLoading ? Text("Loading") : nil
        }.onAppear {
            self.cancellable = self.client.fetch(query: self.query) { result in
                defer {
                    self.cancellable = nil
                    self.isLoading = false
                }
                switch result {
                case let .success(result):
                    self.value = result.data
                    self.error = result.errors?.map { $0.description }.joined(separator: ", ")
                case let .failure(error):
                    self.error = error.localizedDescription
                }
            }
            self.isLoading = true
        }.onDisappear {
            self.cancellable?.cancel()
        }
    }
}

struct GraphQLPath<Value> {
    fileprivate init() {}
}

protocol Fragment {
    associatedtype UnderlyingType
}

extension Array: Fragment where Element: Fragment {
    typealias UnderlyingType = [Element.UnderlyingType]
}

extension Optional: Fragment where Wrapped: Fragment {
    typealias UnderlyingType = Wrapped.UnderlyingType?
}

struct GraphQLFragmentPath<UnderlyingType> {
    fileprivate init() {}
}

extension GraphQLFragmentPath {
    var fragment: GraphQLFragmentPath<UnderlyingType> {
        return self
    }
}

enum GraphQLArgument<Value> {
    enum QueryArgument {
        case withDefault(Value)
        case forced
    }

    case value(Value)
    case argument(QueryArgument)
}

extension GraphQLArgument {
    static var argument: GraphQLArgument<Value> {
        return .argument(.forced)
    }

    static func argument(default value: Value) -> GraphQLArgument<Value> {
        return .argument(.withDefault(value))
    }
}

@propertyWrapper
struct GraphQL<Value> {
    var wrappedValue: Value

    init(_: @autoclosure () -> GraphQLPath<Value>) {
        fatalError("Initializer with path only should never be used")
    }

    fileprivate init(_ wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

extension GraphQL where Value: Fragment {
    init(_: @autoclosure () -> GraphQLFragmentPath<Value.UnderlyingType>) {
        fatalError("Initializer with path only should never be used")
    }

    fileprivate init(_ wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

struct Countries {
    let client: ApolloClient

    static var continents: GraphQLFragmentPath<[Countries.Continent?]?> { .init() }

    static func continent(code _: GraphQLArgument<String?> = .argument) -> GraphQLFragmentPath<Countries.Continent?> {
        return .init()
    }

    static var continent: GraphQLFragmentPath<Countries.Continent?> { .init() }

    static var countries: GraphQLFragmentPath<[Countries.Country?]?> { .init() }

    static func country(code _: GraphQLArgument<String?> = .argument) -> GraphQLFragmentPath<Countries.Country?> {
        return .init()
    }

    static var country: GraphQLFragmentPath<Countries.Country?> { .init() }

    static var languages: GraphQLFragmentPath<[Countries.Language?]?> { .init() }

    static func language(code _: GraphQLArgument<String?> = .argument) -> GraphQLFragmentPath<Countries.Language?> {
        return .init()
    }

    static var language: GraphQLFragmentPath<Countries.Language?> { .init() }

    enum Continent {
        static var code: GraphQLPath<String?> { .init() }

        static var name: GraphQLPath<String?> { .init() }

        static var countries: GraphQLFragmentPath<[Countries.Country?]?> { .init() }

        static var fragment: GraphQLFragmentPath<Continent> { .init() }
    }

    enum Country {
        static var code: GraphQLPath<String?> { .init() }

        static var name: GraphQLPath<String?> { .init() }

        static var native: GraphQLPath<String?> { .init() }

        static var phone: GraphQLPath<String?> { .init() }

        static var continent: GraphQLFragmentPath<Countries.Continent?> { .init() }

        static var currency: GraphQLPath<String?> { .init() }

        static var languages: GraphQLFragmentPath<[Countries.Language?]?> { .init() }

        static var emoji: GraphQLPath<String?> { .init() }

        static var emojiU: GraphQLPath<String?> { .init() }

        static var fragment: GraphQLFragmentPath<Country> { .init() }
    }

    enum Language {
        static var code: GraphQLPath<String?> { .init() }

        static var name: GraphQLPath<String?> { .init() }

        static var native: GraphQLPath<String?> { .init() }

        static var rtl: GraphQLPath<Int?> { .init() }

        static var fragment: GraphQLFragmentPath<Language> { .init() }
    }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Continent {
    var code: GraphQLPath<String?> { .init() }

    var name: GraphQLPath<String?> { .init() }

    var countries: GraphQLFragmentPath<[Countries.Country?]?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Continent? {
    var code: GraphQLPath<String?> { .init() }

    var name: GraphQLPath<String?> { .init() }

    var countries: GraphQLFragmentPath<[Countries.Country?]?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Country {
    var code: GraphQLPath<String?> { .init() }

    var name: GraphQLPath<String?> { .init() }

    var native: GraphQLPath<String?> { .init() }

    var phone: GraphQLPath<String?> { .init() }

    var continent: GraphQLFragmentPath<Countries.Continent?> { .init() }

    var currency: GraphQLPath<String?> { .init() }

    var languages: GraphQLFragmentPath<[Countries.Language?]?> { .init() }

    var emoji: GraphQLPath<String?> { .init() }

    var emojiU: GraphQLPath<String?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Country? {
    var code: GraphQLPath<String?> { .init() }

    var name: GraphQLPath<String?> { .init() }

    var native: GraphQLPath<String?> { .init() }

    var phone: GraphQLPath<String?> { .init() }

    var continent: GraphQLFragmentPath<Countries.Continent?> { .init() }

    var currency: GraphQLPath<String?> { .init() }

    var languages: GraphQLFragmentPath<[Countries.Language?]?> { .init() }

    var emoji: GraphQLPath<String?> { .init() }

    var emojiU: GraphQLPath<String?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Language {
    var code: GraphQLPath<String?> { .init() }

    var name: GraphQLPath<String?> { .init() }

    var native: GraphQLPath<String?> { .init() }

    var rtl: GraphQLPath<Int?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Language? {
    var code: GraphQLPath<String?> { .init() }

    var name: GraphQLPath<String?> { .init() }

    var native: GraphQLPath<String?> { .init() }

    var rtl: GraphQLPath<Int?> { .init() }
}

extension ContinentCellContinent: Fragment {
    typealias UnderlyingType = Countries.Continent
}

extension ContinentCell {
    typealias Continent = ContinentCellContinent

    init(api: Countries,
         continent: Continent) {
        self.init(api: api,
                  code: GraphQL(continent.code),
                  name: GraphQL(continent.name))
    }
}

extension CountryCellCountry: Fragment {
    typealias UnderlyingType = Countries.Country
}

extension CountryCell {
    typealias Country = CountryCellCountry

    init(api: Countries,
         country: Country) {
        self.init(api: api,
                  code: GraphQL(country.code),
                  emoji: GraphQL(country.emoji),
                  name: GraphQL(country.name))
    }
}

extension CountryDetailBasicInfoViewCountry: Fragment {
    typealias UnderlyingType = Countries.Country
}

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

extension CountryDetailView {
    typealias Data = CountryDetailViewQuery.Data

    init(api: Countries,
         data: Data) {
        self.init(api: api,
                  basicInfo: GraphQL(data.country?.fragments.countryDetailBasicInfoViewCountry),
                  name: GraphQL(data.country?.name),
                  continent: GraphQL(data.country?.continent?.fragments.continentCellContinent),
                  languages: GraphQL(data.country?.languages?.map { $0?.fragments.languageCellLanguage }))
    }
}

extension Countries {
    func countryDetailView(code: String?) -> some View {
        return QueryRenderer(client: client,
                             query: CountryDetailViewQuery(code: code)) { data in

            CountryDetailView(api: self,
                              data: data)
        }
    }
}

extension CountryListForContinent {
    typealias Data = CountryListForContinentQuery.Data

    init(api: Countries,
         data: Data) {
        self.init(api: api,
                  name: GraphQL(data.continent?.name),
                  countries: GraphQL(data.continent?.countries?.map { $0?.fragments.countryCellCountry }))
    }
}

extension Countries {
    func countryListForContinent(code: String?) -> some View {
        return QueryRenderer(client: client,
                             query: CountryListForContinentQuery(code: code)) { data in

            CountryListForContinent(api: self,
                                    data: data)
        }
    }
}

extension FullContinentList {
    typealias Data = FullContinentListQuery.Data

    init(api: Countries,
         data: Data) {
        self.init(api: api,
                  continents: GraphQL(data.continents?.map { $0?.fragments.continentCellContinent }))
    }
}

extension Countries {
    func fullContinentList() -> some View {
        return QueryRenderer(client: client,
                             query: FullContinentListQuery()) { data in

            FullContinentList(api: self,
                              data: data)
        }
    }
}

extension FullCountryList {
    typealias Data = FullCountryListQuery.Data

    init(api: Countries,
         data: Data) {
        self.init(api: api,
                  countries: GraphQL(data.countries?.map { $0?.fragments.countryCellCountry }))
    }
}

extension Countries {
    func fullCountryList() -> some View {
        return QueryRenderer(client: client,
                             query: FullCountryListQuery()) { data in

            FullCountryList(api: self,
                            data: data)
        }
    }
}

extension FullLanguageList {
    typealias Data = FullLanguageListQuery.Data

    init(data: Data) {
        self.init(languages: GraphQL(data.languages?.map { $0?.fragments.languageCellLanguage }))
    }
}

extension Countries {
    func fullLanguageList() -> some View {
        return QueryRenderer(client: client,
                             query: FullLanguageListQuery()) { data in

            FullLanguageList(data: data)
        }
    }
}

extension LanguageCellLanguage: Fragment {
    typealias UnderlyingType = Countries.Language
}

extension LanguageCell {
    typealias Language = LanguageCellLanguage

    init(language: Language) {
        self.init(name: GraphQL(language.name))
    }
}
