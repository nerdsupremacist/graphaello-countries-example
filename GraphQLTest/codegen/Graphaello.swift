// swiftlint:disable all
// This file was automatically generated and should not be edited.

import Apollo
import Foundation
import SwiftUI

// MARK: Basic API

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

// MARK: - Countries

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

// MARK: - ContinentCell

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

// MARK: - CountryCell

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

// MARK: - CountryDetailBasicInfoView

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

// MARK: - CountryDetailView

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

// MARK: - CountryListForContinent

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

// MARK: - FullContinentList

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

// MARK: - FullCountryList

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

// MARK: - FullLanguageList

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

// MARK: - LanguageCell

extension LanguageCellLanguage: Fragment {
    typealias UnderlyingType = Countries.Language
}

extension LanguageCell {
    typealias Language = LanguageCellLanguage

    init(language: Language) {
        self.init(name: GraphQL(language.name))
    }
}

//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CountryDetailViewQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition =
        """
        query CountryDetailView($code: String) {
          country(code: $code) {
            __typename
            ...CountryDetailBasicInfoViewCountry
            continent {
              __typename
              ...ContinentCellContinent
            }
            languages {
              __typename
              ...LanguageCellLanguage
            }
            name
          }
        }
        """

    public let operationName = "CountryDetailView"

    public var queryDocument: String { return operationDefinition.appending(CountryDetailBasicInfoViewCountry.fragmentDefinition).appending(ContinentCellContinent.fragmentDefinition).appending(LanguageCellLanguage.fragmentDefinition) }

    public var code: String?

    public init(code: String? = nil) {
        self.code = code
    }

    public var variables: GraphQLMap? {
        return ["code": code]
    }

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Query"]

        public static let selections: [GraphQLSelection] = [
            GraphQLField("country", arguments: ["code": GraphQLVariable("code")], type: .object(Country.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(country: Country? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "country": country.flatMap { (value: Country) -> ResultMap in value.resultMap }])
        }

        public var country: Country? {
            get {
                return (resultMap["country"] as? ResultMap).flatMap { Country(unsafeResultMap: $0) }
            }
            set {
                resultMap.updateValue(newValue?.resultMap, forKey: "country")
            }
        }

        public struct Country: GraphQLSelectionSet {
            public static let possibleTypes = ["Country"]

            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLFragmentSpread(CountryDetailBasicInfoViewCountry.self),
                GraphQLField("continent", type: .object(Continent.selections)),
                GraphQLField("languages", type: .list(.object(Language.selections))),
                GraphQLField("name", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var continent: Continent? {
                get {
                    return (resultMap["continent"] as? ResultMap).flatMap { Continent(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "continent")
                }
            }

            public var languages: [Language?]? {
                get {
                    return (resultMap["languages"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Language?] in value.map { (value: ResultMap?) -> Language? in value.flatMap { (value: ResultMap) -> Language in Language(unsafeResultMap: value) } } }
                }
                set {
                    resultMap.updateValue(newValue.flatMap { (value: [Language?]) -> [ResultMap?] in value.map { (value: Language?) -> ResultMap? in value.flatMap { (value: Language) -> ResultMap in value.resultMap } } }, forKey: "languages")
                }
            }

            public var name: String? {
                get {
                    return resultMap["name"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "name")
                }
            }

            public var fragments: Fragments {
                get {
                    return Fragments(unsafeResultMap: resultMap)
                }
                set {
                    resultMap += newValue.resultMap
                }
            }

            public struct Fragments {
                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public var countryDetailBasicInfoViewCountry: CountryDetailBasicInfoViewCountry {
                    get {
                        return CountryDetailBasicInfoViewCountry(unsafeResultMap: resultMap)
                    }
                    set {
                        resultMap += newValue.resultMap
                    }
                }
            }

            public struct Continent: GraphQLSelectionSet {
                public static let possibleTypes = ["Continent"]

                public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLFragmentSpread(ContinentCellContinent.self),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(code: String? = nil, name: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Continent", "code": code, "name": name])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var fragments: Fragments {
                    get {
                        return Fragments(unsafeResultMap: resultMap)
                    }
                    set {
                        resultMap += newValue.resultMap
                    }
                }

                public struct Fragments {
                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                        resultMap = unsafeResultMap
                    }

                    public var continentCellContinent: ContinentCellContinent {
                        get {
                            return ContinentCellContinent(unsafeResultMap: resultMap)
                        }
                        set {
                            resultMap += newValue.resultMap
                        }
                    }
                }
            }

            public struct Language: GraphQLSelectionSet {
                public static let possibleTypes = ["Language"]

                public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLFragmentSpread(LanguageCellLanguage.self),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(name: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Language", "name": name])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var fragments: Fragments {
                    get {
                        return Fragments(unsafeResultMap: resultMap)
                    }
                    set {
                        resultMap += newValue.resultMap
                    }
                }

                public struct Fragments {
                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                        resultMap = unsafeResultMap
                    }

                    public var languageCellLanguage: LanguageCellLanguage {
                        get {
                            return LanguageCellLanguage(unsafeResultMap: resultMap)
                        }
                        set {
                            resultMap += newValue.resultMap
                        }
                    }
                }
            }
        }
    }
}

public final class CountryListForContinentQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition =
        """
        query CountryListForContinent($code: String) {
          continent(code: $code) {
            __typename
            countries {
              __typename
              ...CountryCellCountry
            }
            name
          }
        }
        """

    public let operationName = "CountryListForContinent"

    public var queryDocument: String { return operationDefinition.appending(CountryCellCountry.fragmentDefinition) }

    public var code: String?

    public init(code: String? = nil) {
        self.code = code
    }

    public var variables: GraphQLMap? {
        return ["code": code]
    }

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Query"]

        public static let selections: [GraphQLSelection] = [
            GraphQLField("continent", arguments: ["code": GraphQLVariable("code")], type: .object(Continent.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(continent: Continent? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "continent": continent.flatMap { (value: Continent) -> ResultMap in value.resultMap }])
        }

        public var continent: Continent? {
            get {
                return (resultMap["continent"] as? ResultMap).flatMap { Continent(unsafeResultMap: $0) }
            }
            set {
                resultMap.updateValue(newValue?.resultMap, forKey: "continent")
            }
        }

        public struct Continent: GraphQLSelectionSet {
            public static let possibleTypes = ["Continent"]

            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("countries", type: .list(.object(Country.selections))),
                GraphQLField("name", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(countries: [Country?]? = nil, name: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Continent", "countries": countries.flatMap { (value: [Country?]) -> [ResultMap?] in value.map { (value: Country?) -> ResultMap? in value.flatMap { (value: Country) -> ResultMap in value.resultMap } } }, "name": name])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var countries: [Country?]? {
                get {
                    return (resultMap["countries"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Country?] in value.map { (value: ResultMap?) -> Country? in value.flatMap { (value: ResultMap) -> Country in Country(unsafeResultMap: value) } } }
                }
                set {
                    resultMap.updateValue(newValue.flatMap { (value: [Country?]) -> [ResultMap?] in value.map { (value: Country?) -> ResultMap? in value.flatMap { (value: Country) -> ResultMap in value.resultMap } } }, forKey: "countries")
                }
            }

            public var name: String? {
                get {
                    return resultMap["name"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "name")
                }
            }

            public struct Country: GraphQLSelectionSet {
                public static let possibleTypes = ["Country"]

                public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLFragmentSpread(CountryCellCountry.self),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(code: String? = nil, emoji: String? = nil, name: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Country", "code": code, "emoji": emoji, "name": name])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var fragments: Fragments {
                    get {
                        return Fragments(unsafeResultMap: resultMap)
                    }
                    set {
                        resultMap += newValue.resultMap
                    }
                }

                public struct Fragments {
                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                        resultMap = unsafeResultMap
                    }

                    public var countryCellCountry: CountryCellCountry {
                        get {
                            return CountryCellCountry(unsafeResultMap: resultMap)
                        }
                        set {
                            resultMap += newValue.resultMap
                        }
                    }
                }
            }
        }
    }
}

public final class FullContinentListQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition =
        """
        query FullContinentList {
          continents {
            __typename
            ...ContinentCellContinent
          }
        }
        """

    public let operationName = "FullContinentList"

    public var queryDocument: String { return operationDefinition.appending(ContinentCellContinent.fragmentDefinition) }

    public init() {}

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Query"]

        public static let selections: [GraphQLSelection] = [
            GraphQLField("continents", type: .list(.object(Continent.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(continents: [Continent?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "continents": continents.flatMap { (value: [Continent?]) -> [ResultMap?] in value.map { (value: Continent?) -> ResultMap? in value.flatMap { (value: Continent) -> ResultMap in value.resultMap } } }])
        }

        public var continents: [Continent?]? {
            get {
                return (resultMap["continents"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Continent?] in value.map { (value: ResultMap?) -> Continent? in value.flatMap { (value: ResultMap) -> Continent in Continent(unsafeResultMap: value) } } }
            }
            set {
                resultMap.updateValue(newValue.flatMap { (value: [Continent?]) -> [ResultMap?] in value.map { (value: Continent?) -> ResultMap? in value.flatMap { (value: Continent) -> ResultMap in value.resultMap } } }, forKey: "continents")
            }
        }

        public struct Continent: GraphQLSelectionSet {
            public static let possibleTypes = ["Continent"]

            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLFragmentSpread(ContinentCellContinent.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(code: String? = nil, name: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Continent", "code": code, "name": name])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var fragments: Fragments {
                get {
                    return Fragments(unsafeResultMap: resultMap)
                }
                set {
                    resultMap += newValue.resultMap
                }
            }

            public struct Fragments {
                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public var continentCellContinent: ContinentCellContinent {
                    get {
                        return ContinentCellContinent(unsafeResultMap: resultMap)
                    }
                    set {
                        resultMap += newValue.resultMap
                    }
                }
            }
        }
    }
}

public final class FullCountryListQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition =
        """
        query FullCountryList {
          countries {
            __typename
            ...CountryCellCountry
          }
        }
        """

    public let operationName = "FullCountryList"

    public var queryDocument: String { return operationDefinition.appending(CountryCellCountry.fragmentDefinition) }

    public init() {}

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Query"]

        public static let selections: [GraphQLSelection] = [
            GraphQLField("countries", type: .list(.object(Country.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(countries: [Country?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "countries": countries.flatMap { (value: [Country?]) -> [ResultMap?] in value.map { (value: Country?) -> ResultMap? in value.flatMap { (value: Country) -> ResultMap in value.resultMap } } }])
        }

        public var countries: [Country?]? {
            get {
                return (resultMap["countries"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Country?] in value.map { (value: ResultMap?) -> Country? in value.flatMap { (value: ResultMap) -> Country in Country(unsafeResultMap: value) } } }
            }
            set {
                resultMap.updateValue(newValue.flatMap { (value: [Country?]) -> [ResultMap?] in value.map { (value: Country?) -> ResultMap? in value.flatMap { (value: Country) -> ResultMap in value.resultMap } } }, forKey: "countries")
            }
        }

        public struct Country: GraphQLSelectionSet {
            public static let possibleTypes = ["Country"]

            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLFragmentSpread(CountryCellCountry.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(code: String? = nil, emoji: String? = nil, name: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Country", "code": code, "emoji": emoji, "name": name])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var fragments: Fragments {
                get {
                    return Fragments(unsafeResultMap: resultMap)
                }
                set {
                    resultMap += newValue.resultMap
                }
            }

            public struct Fragments {
                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public var countryCellCountry: CountryCellCountry {
                    get {
                        return CountryCellCountry(unsafeResultMap: resultMap)
                    }
                    set {
                        resultMap += newValue.resultMap
                    }
                }
            }
        }
    }
}

public final class FullLanguageListQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition =
        """
        query FullLanguageList {
          languages {
            __typename
            ...LanguageCellLanguage
          }
        }
        """

    public let operationName = "FullLanguageList"

    public var queryDocument: String { return operationDefinition.appending(LanguageCellLanguage.fragmentDefinition) }

    public init() {}

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Query"]

        public static let selections: [GraphQLSelection] = [
            GraphQLField("languages", type: .list(.object(Language.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(languages: [Language?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "languages": languages.flatMap { (value: [Language?]) -> [ResultMap?] in value.map { (value: Language?) -> ResultMap? in value.flatMap { (value: Language) -> ResultMap in value.resultMap } } }])
        }

        public var languages: [Language?]? {
            get {
                return (resultMap["languages"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Language?] in value.map { (value: ResultMap?) -> Language? in value.flatMap { (value: ResultMap) -> Language in Language(unsafeResultMap: value) } } }
            }
            set {
                resultMap.updateValue(newValue.flatMap { (value: [Language?]) -> [ResultMap?] in value.map { (value: Language?) -> ResultMap? in value.flatMap { (value: Language) -> ResultMap in value.resultMap } } }, forKey: "languages")
            }
        }

        public struct Language: GraphQLSelectionSet {
            public static let possibleTypes = ["Language"]

            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLFragmentSpread(LanguageCellLanguage.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(name: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Language", "name": name])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var fragments: Fragments {
                get {
                    return Fragments(unsafeResultMap: resultMap)
                }
                set {
                    resultMap += newValue.resultMap
                }
            }

            public struct Fragments {
                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public var languageCellLanguage: LanguageCellLanguage {
                    get {
                        return LanguageCellLanguage(unsafeResultMap: resultMap)
                    }
                    set {
                        resultMap += newValue.resultMap
                    }
                }
            }
        }
    }
}

public struct ContinentCellContinent: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition =
        """
        fragment ContinentCellContinent on Continent {
          __typename
          code
          name
        }
        """

    public static let possibleTypes = ["Continent"]

    public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("code", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
    }

    public init(code: String? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Continent", "code": code, "name": name])
    }

    public var __typename: String {
        get {
            return resultMap["__typename"]! as! String
        }
        set {
            resultMap.updateValue(newValue, forKey: "__typename")
        }
    }

    public var code: String? {
        get {
            return resultMap["code"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "code")
        }
    }

    public var name: String? {
        get {
            return resultMap["name"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "name")
        }
    }
}

public struct CountryCellCountry: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition =
        """
        fragment CountryCellCountry on Country {
          __typename
          code
          emoji
          name
        }
        """

    public static let possibleTypes = ["Country"]

    public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("code", type: .scalar(String.self)),
        GraphQLField("emoji", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
    }

    public init(code: String? = nil, emoji: String? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Country", "code": code, "emoji": emoji, "name": name])
    }

    public var __typename: String {
        get {
            return resultMap["__typename"]! as! String
        }
        set {
            resultMap.updateValue(newValue, forKey: "__typename")
        }
    }

    public var code: String? {
        get {
            return resultMap["code"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "code")
        }
    }

    public var emoji: String? {
        get {
            return resultMap["emoji"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "emoji")
        }
    }

    public var name: String? {
        get {
            return resultMap["name"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "name")
        }
    }
}

public struct CountryDetailBasicInfoViewCountry: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition =
        """
        fragment CountryDetailBasicInfoViewCountry on Country {
          __typename
          code
          currency
          emoji
          name
          native
          phone
        }
        """

    public static let possibleTypes = ["Country"]

    public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("code", type: .scalar(String.self)),
        GraphQLField("currency", type: .scalar(String.self)),
        GraphQLField("emoji", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("native", type: .scalar(String.self)),
        GraphQLField("phone", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
    }

    public init(code: String? = nil, currency: String? = nil, emoji: String? = nil, name: String? = nil, native: String? = nil, phone: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Country", "code": code, "currency": currency, "emoji": emoji, "name": name, "native": native, "phone": phone])
    }

    public var __typename: String {
        get {
            return resultMap["__typename"]! as! String
        }
        set {
            resultMap.updateValue(newValue, forKey: "__typename")
        }
    }

    public var code: String? {
        get {
            return resultMap["code"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "code")
        }
    }

    public var currency: String? {
        get {
            return resultMap["currency"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "currency")
        }
    }

    public var emoji: String? {
        get {
            return resultMap["emoji"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "emoji")
        }
    }

    public var name: String? {
        get {
            return resultMap["name"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "name")
        }
    }

    public var native: String? {
        get {
            return resultMap["native"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "native")
        }
    }

    public var phone: String? {
        get {
            return resultMap["phone"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "phone")
        }
    }
}

public struct LanguageCellLanguage: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition =
        """
        fragment LanguageCellLanguage on Language {
          __typename
          name
        }
        """

    public static let possibleTypes = ["Language"]

    public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
    }

    public init(name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Language", "name": name])
    }

    public var __typename: String {
        get {
            return resultMap["__typename"]! as! String
        }
        set {
            resultMap.updateValue(newValue, forKey: "__typename")
        }
    }

    public var name: String? {
        get {
            return resultMap["name"] as? String
        }
        set {
            resultMap.updateValue(newValue, forKey: "name")
        }
    }
}
