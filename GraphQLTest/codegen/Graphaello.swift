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

protocol Fragment {
    associatedtype UnderlyingType
}

protocol Target {}

protocol API: Target {}

protocol Connection: Target {
    associatedtype Node
}

extension Array: Fragment where Element: Fragment {
    typealias UnderlyingType = [Element.UnderlyingType]
}

extension Optional: Fragment where Wrapped: Fragment {
    typealias UnderlyingType = Wrapped.UnderlyingType?
}

struct GraphQLPath<TargetType: Target, Value> {
    fileprivate init() {}
}

struct GraphQLFragmentPath<TargetType: Target, UnderlyingType> {
    fileprivate init() {}
}

extension GraphQLFragmentPath {
    typealias Path<V> = GraphQLPath<TargetType, V>
    typealias FragmentPath<V> = GraphQLFragmentPath<TargetType, V>
}

extension GraphQLFragmentPath {
    var _fragment: FragmentPath<UnderlyingType> {
        return self
    }
}

extension GraphQLFragmentPath {
    func _forEach<Value, Output>(_: KeyPath<GraphQLFragmentPath<TargetType, Value>, GraphQLPath<TargetType, Output>>) -> GraphQLPath<TargetType, [Output]> where UnderlyingType == [Value] {
        return .init()
    }

    func _forEach<Value, Output>(_: KeyPath<GraphQLFragmentPath<TargetType, Value>, GraphQLPath<TargetType, Output>>) -> GraphQLPath<TargetType, [Output]?> where UnderlyingType == [Value]? {
        return .init()
    }
}

extension GraphQLFragmentPath {
    func _forEach<Value, Output>(_: KeyPath<GraphQLFragmentPath<TargetType, Value>, GraphQLFragmentPath<TargetType, Output>>) -> GraphQLFragmentPath<TargetType, [Output]> where UnderlyingType == [Value] {
        return .init()
    }

    func _forEach<Value, Output>(_: KeyPath<GraphQLFragmentPath<TargetType, Value>, GraphQLFragmentPath<TargetType, Output>>) -> GraphQLFragmentPath<TargetType, [Output]?> where UnderlyingType == [Value]? {
        return .init()
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

class Paging<Value: Fragment>: DynamicProperty, ObservableObject {
    fileprivate struct Response {
        let values: [Value]
        let cursor: String?
        let hasMore: Bool

        static var empty: Response {
            Response(values: [], cursor: nil, hasMore: false)
        }
    }

    fileprivate typealias Completion = (Result<Response, Error>) -> Void
    fileprivate typealias Loader = (String, @escaping Completion) -> Void

    private let loader: Loader

    @Published
    private(set) var isLoading: Bool = false

    @Published
    private(set) var values: [Value] = []

    private var cursor: String?

    @Published
    private(set) var hasMore: Bool = false

    @Published
    private(set) var error: Error? = nil

    fileprivate init(_ response: Response, loader: @escaping Loader) {
        self.loader = loader
        use(response)
    }

    func loadMore() {
        guard let cursor = cursor, !isLoading else { return }
        isLoading = true
        loader(cursor) { [weak self] result in
            switch result {
            case let .success(response):
                self?.use(response)
            case let .failure(error):
                self?.handle(error)
            }
        }
    }

    private func use(_ response: Response) {
        isLoading = false
        values += response.values
        cursor = response.cursor
        hasMore = response.hasMore
    }

    private func handle(_ error: Error) {
        isLoading = false
        hasMore = false
        self.error = error
    }
}

struct PagingView<Value: Fragment>: View {
    enum Data {
        case item(Value, Int)
        case loading
        case error(Error)

        fileprivate var id: String {
            switch self {
            case let .item(_, int):
                return int.description
            case .error:
                return "error"
            case .loading:
                return "loading"
            }
        }
    }

    @ObservedObject private var paging: Paging<Value>
    private var loader: (Data) -> AnyView

    init(_ paging: Paging<Value>, loader: @escaping (Data) -> AnyView) {
        self.paging = paging
        self.loader = loader
    }

    var body: some View {
        ForEach((paging.values.enumerated().map { Data.item($0.element, $0.offset) } +
                    [paging.isLoading ? Data.loading : nil, paging.error.map(Data.error)].compactMap { $0 }),
        id: \.id) { data in

            self.loader(data).onAppear { self.onAppear(data: data) }
        }
    }

    private func onAppear(data: Data) {
        guard !paging.isLoading,
            paging.hasMore,
            case let .item(_, index) = data,
            index > paging.values.count - 2 else { return }

        paging.loadMore()
    }
}

extension PagingView {
    init<Loading: View, Error: View, Data: View>(_ paging: Paging<Value>,
                                                 loading loadingView: @escaping () -> Loading,
                                                 error errorView: @escaping (Swift.Error) -> Error,
                                                 item itemView: @escaping (Value) -> Data) {
        self.init(paging) { data in
            switch data {
            case let .item(item, _):
                return AnyView(itemView(item))
            case let .error(error):
                return AnyView(errorView(error))
            case .loading:
                return AnyView(loadingView())
            }
        }
    }

    init<Error: View, Data: View>(_ paging: Paging<Value>,
                                  error errorView: @escaping (Swift.Error) -> Error,
                                  item itemView: @escaping (Value) -> Data) {
        self.init(paging,
                  loading: { Text("Loading") },
                  error: errorView,
                  item: itemView)
    }

    init<Loading: View, Data: View>(_ paging: Paging<Value>,
                                    loading loadingView: @escaping () -> Loading,
                                    item itemView: @escaping (Value) -> Data) {
        self.init(paging,
                  loading: loadingView,
                  error: { Text("Error: \($0.localizedDescription)") },
                  item: itemView)
    }

    init<Data: View>(_ paging: Paging<Value>,
                     item itemView: @escaping (Value) -> Data) {
        self.init(paging,
                  loading: { Text("Loading") },
                  error: { Text("Error: \($0.localizedDescription)") },
                  item: itemView)
    }
}

@propertyWrapper
struct GraphQL<Value> {
    var wrappedValue: Value

    init<T: Target>(_: @autoclosure () -> GraphQLPath<T, Value>) {
        fatalError("Initializer with path only should never be used")
    }

    fileprivate init(_ wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

extension GraphQL where Value: Fragment {
    init<T: Target>(_: @autoclosure () -> GraphQLFragmentPath<T, Value.UnderlyingType>) {
        fatalError("Initializer with path only should never be used")
    }
}

extension GraphQL {
    init<T: API, C: Connection, F: Fragment>(_: @autoclosure () -> GraphQLFragmentPath<T, C>) where Value == Paging<F>, C.Node == F.UnderlyingType {
        fatalError("Initializer with path only should never be used")
    }

    init<T: API, C: Connection, F: Fragment>(_: @autoclosure () -> GraphQLFragmentPath<T, C?>) where Value == Paging<F>?, C.Node == F.UnderlyingType {
        fatalError("Initializer with path only should never be used")
    }
}

extension RawRepresentable {
    fileprivate init?<Other: RawRepresentable>(_ other: Other?) where Other.RawValue == RawValue {
        guard let rawValue = other?.rawValue else { return nil }
        self.init(rawValue: rawValue)
    }

    fileprivate init<Other: RawRepresentable>(_ other: Other) where Other.RawValue == RawValue {
        guard let value = Self(rawValue: other.rawValue) else { fatalError() }
        self = value
    }
}

// MARK: - Countries

struct Countries: API {
    let client: ApolloClient

    typealias Query = Countries
    typealias Path<V> = GraphQLPath<Countries, V>
    typealias FragmentPath<V> = GraphQLFragmentPath<Countries, V>

    static var continents: FragmentPath<[Countries.Continent?]?> { .init() }

    static func continent(code _: GraphQLArgument<String?> = .argument) -> FragmentPath<Countries.Continent?> {
        return .init()
    }

    static var continent: FragmentPath<Countries.Continent?> { .init() }

    static var countries: FragmentPath<[Countries.Country?]?> { .init() }

    static func country(code _: GraphQLArgument<String?> = .argument) -> FragmentPath<Countries.Country?> {
        return .init()
    }

    static var country: FragmentPath<Countries.Country?> { .init() }

    static var languages: FragmentPath<[Countries.Language?]?> { .init() }

    static func language(code _: GraphQLArgument<String?> = .argument) -> FragmentPath<Countries.Language?> {
        return .init()
    }

    static var language: FragmentPath<Countries.Language?> { .init() }

    enum Continent: Target {
        typealias Path<V> = GraphQLPath<Continent, V>
        typealias FragmentPath<V> = GraphQLFragmentPath<Continent, V>

        static var code: Path<String?> { .init() }

        static var name: Path<String?> { .init() }

        static var countries: FragmentPath<[Countries.Country?]?> { .init() }

        static var _fragment: FragmentPath<Continent> { .init() }
    }

    enum Country: Target {
        typealias Path<V> = GraphQLPath<Country, V>
        typealias FragmentPath<V> = GraphQLFragmentPath<Country, V>

        static var code: Path<String?> { .init() }

        static var name: Path<String?> { .init() }

        static var native: Path<String?> { .init() }

        static var phone: Path<String?> { .init() }

        static var continent: FragmentPath<Countries.Continent?> { .init() }

        static var currency: Path<String?> { .init() }

        static var languages: FragmentPath<[Countries.Language?]?> { .init() }

        static var emoji: Path<String?> { .init() }

        static var emojiU: Path<String?> { .init() }

        static var _fragment: FragmentPath<Country> { .init() }
    }

    enum Language: Target {
        typealias Path<V> = GraphQLPath<Language, V>
        typealias FragmentPath<V> = GraphQLFragmentPath<Language, V>

        static var code: Path<String?> { .init() }

        static var name: Path<String?> { .init() }

        static var native: Path<String?> { .init() }

        static var rtl: Path<Int?> { .init() }

        static var _fragment: FragmentPath<Language> { .init() }
    }

    enum CacheControlScope: String, Target {
        typealias Path<V> = GraphQLPath<CacheControlScope, V>
        typealias FragmentPath<V> = GraphQLFragmentPath<CacheControlScope, V>

        case `public` = "PUBLIC"

        case `private` = "PRIVATE"

        static var _fragment: FragmentPath<CacheControlScope> { .init() }
    }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Continent {
    var code: Path<String?> { .init() }

    var name: Path<String?> { .init() }

    var countries: FragmentPath<[Countries.Country?]?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Continent? {
    var code: Path<String?> { .init() }

    var name: Path<String?> { .init() }

    var countries: FragmentPath<[Countries.Country?]?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Country {
    var code: Path<String?> { .init() }

    var name: Path<String?> { .init() }

    var native: Path<String?> { .init() }

    var phone: Path<String?> { .init() }

    var continent: FragmentPath<Countries.Continent?> { .init() }

    var currency: Path<String?> { .init() }

    var languages: FragmentPath<[Countries.Language?]?> { .init() }

    var emoji: Path<String?> { .init() }

    var emojiU: Path<String?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Country? {
    var code: Path<String?> { .init() }

    var name: Path<String?> { .init() }

    var native: Path<String?> { .init() }

    var phone: Path<String?> { .init() }

    var continent: FragmentPath<Countries.Continent?> { .init() }

    var currency: Path<String?> { .init() }

    var languages: FragmentPath<[Countries.Language?]?> { .init() }

    var emoji: Path<String?> { .init() }

    var emojiU: Path<String?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Language {
    var code: Path<String?> { .init() }

    var name: Path<String?> { .init() }

    var native: Path<String?> { .init() }

    var rtl: Path<Int?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.Language? {
    var code: Path<String?> { .init() }

    var name: Path<String?> { .init() }

    var native: Path<String?> { .init() }

    var rtl: Path<Int?> { .init() }
}

extension GraphQLFragmentPath where UnderlyingType == Countries.CacheControlScope {}

extension GraphQLFragmentPath where UnderlyingType == Countries.CacheControlScope? {}

// MARK: - ContinentCell

extension ApolloStuff.ContinentCellContinent: Fragment {
    typealias UnderlyingType = Countries.Continent
}

extension ContinentCell {
    typealias Continent = ApolloStuff.ContinentCellContinent

    init(api: Countries,
         continent: Continent) {
        self.init(api: api,
                  code: GraphQL(continent.code),
                  name: GraphQL(continent.name))
    }
}

// MARK: - CountryCell

extension ApolloStuff.CountryCellCountry: Fragment {
    typealias UnderlyingType = Countries.Country
}

extension CountryCell {
    typealias Country = ApolloStuff.CountryCellCountry

    init(api: Countries,
         country: Country) {
        self.init(api: api,
                  code: GraphQL(country.code),
                  emoji: GraphQL(country.emoji),
                  name: GraphQL(country.name))
    }
}

// MARK: - CountryDetailBasicInfoView

extension ApolloStuff.CountryDetailBasicInfoViewCountry: Fragment {
    typealias UnderlyingType = Countries.Country
}

extension CountryDetailBasicInfoView {
    typealias Country = ApolloStuff.CountryDetailBasicInfoViewCountry

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
    typealias Data = ApolloStuff.CountryDetailViewQuery.Data

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
    func countryDetailView(code: String? = nil) -> some View {
        return QueryRenderer(client: client,
                             query: ApolloStuff.CountryDetailViewQuery(code: code)) { data in

            CountryDetailView(api: self,
                              data: data)
        }
    }
}

// MARK: - CountryListForContinent

extension CountryListForContinent {
    typealias Data = ApolloStuff.CountryListForContinentQuery.Data

    init(api: Countries,
         data: Data) {
        self.init(api: api,
                  name: GraphQL(data.continent?.name),
                  countries: GraphQL(data.continent?.countries?.map { $0?.fragments.countryCellCountry }))
    }
}

extension Countries {
    func countryListForContinent(code: String? = nil) -> some View {
        return QueryRenderer(client: client,
                             query: ApolloStuff.CountryListForContinentQuery(code: code)) { data in

            CountryListForContinent(api: self,
                                    data: data)
        }
    }
}

// MARK: - FullContinentList

extension FullContinentList {
    typealias Data = ApolloStuff.FullContinentListQuery.Data

    init(api: Countries,
         data: Data) {
        self.init(api: api,
                  continents: GraphQL(data.continents?.map { $0?.fragments.continentCellContinent }))
    }
}

extension Countries {
    func fullContinentList() -> some View {
        return QueryRenderer(client: client,
                             query: ApolloStuff.FullContinentListQuery()) { data in

            FullContinentList(api: self,
                              data: data)
        }
    }
}

// MARK: - FullCountryList

extension FullCountryList {
    typealias Data = ApolloStuff.FullCountryListQuery.Data

    init(api: Countries,
         data: Data) {
        self.init(api: api,
                  countries: GraphQL(data.countries?.map { $0?.fragments.countryCellCountry }))
    }
}

extension Countries {
    func fullCountryList() -> some View {
        return QueryRenderer(client: client,
                             query: ApolloStuff.FullCountryListQuery()) { data in

            FullCountryList(api: self,
                            data: data)
        }
    }
}

// MARK: - FullLanguageList

extension FullLanguageList {
    typealias Data = ApolloStuff.FullLanguageListQuery.Data

    init(data: Data) {
        self.init(languages: GraphQL(data.languages?.map { $0?.fragments.languageCellLanguage }))
    }
}

extension Countries {
    func fullLanguageList() -> some View {
        return QueryRenderer(client: client,
                             query: ApolloStuff.FullLanguageListQuery()) { data in

            FullLanguageList(data: data)
        }
    }
}

// MARK: - LanguageCell

extension ApolloStuff.LanguageCellLanguage: Fragment {
    typealias UnderlyingType = Countries.Language
}

extension LanguageCell {
    typealias Language = ApolloStuff.LanguageCellLanguage

    init(language: Language) {
        self.init(name: GraphQL(language.name))
    }
}

//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloStuff namespace
public enum ApolloStuff {
    public final class CountryDetailViewQuery: GraphQLQuery {
        /// The raw GraphQL definition of this operation.
        public let operationDefinition: String =
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

        public let operationName: String = "CountryDetailView"

        public var queryDocument: String { return operationDefinition.appending(CountryDetailBasicInfoViewCountry.fragmentDefinition).appending(ContinentCellContinent.fragmentDefinition).appending(LanguageCellLanguage.fragmentDefinition) }

        public var code: String?

        public init(code: String? = nil) {
            self.code = code
        }

        public var variables: GraphQLMap? {
            return ["code": code]
        }

        public struct Data: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Query"]

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
                public static let possibleTypes: [String] = ["Country"]

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
                    public static let possibleTypes: [String] = ["Continent"]

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
                    public static let possibleTypes: [String] = ["Language"]

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
        public let operationDefinition: String =
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

        public let operationName: String = "CountryListForContinent"

        public var queryDocument: String { return operationDefinition.appending(CountryCellCountry.fragmentDefinition) }

        public var code: String?

        public init(code: String? = nil) {
            self.code = code
        }

        public var variables: GraphQLMap? {
            return ["code": code]
        }

        public struct Data: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Query"]

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
                public static let possibleTypes: [String] = ["Continent"]

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
                    public static let possibleTypes: [String] = ["Country"]

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
        public let operationDefinition: String =
            """
            query FullContinentList {
              continents {
                __typename
                ...ContinentCellContinent
              }
            }
            """

        public let operationName: String = "FullContinentList"

        public var queryDocument: String { return operationDefinition.appending(ContinentCellContinent.fragmentDefinition) }

        public init() {}

        public struct Data: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Query"]

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
                public static let possibleTypes: [String] = ["Continent"]

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
        public let operationDefinition: String =
            """
            query FullCountryList {
              countries {
                __typename
                ...CountryCellCountry
              }
            }
            """

        public let operationName: String = "FullCountryList"

        public var queryDocument: String { return operationDefinition.appending(CountryCellCountry.fragmentDefinition) }

        public init() {}

        public struct Data: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Query"]

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
                public static let possibleTypes: [String] = ["Country"]

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
        public let operationDefinition: String =
            """
            query FullLanguageList {
              languages {
                __typename
                ...LanguageCellLanguage
              }
            }
            """

        public let operationName: String = "FullLanguageList"

        public var queryDocument: String { return operationDefinition.appending(LanguageCellLanguage.fragmentDefinition) }

        public init() {}

        public struct Data: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Query"]

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
                public static let possibleTypes: [String] = ["Language"]

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
        public static let fragmentDefinition: String =
            """
            fragment ContinentCellContinent on Continent {
              __typename
              code
              name
            }
            """

        public static let possibleTypes: [String] = ["Continent"]

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
        public static let fragmentDefinition: String =
            """
            fragment CountryCellCountry on Country {
              __typename
              code
              emoji
              name
            }
            """

        public static let possibleTypes: [String] = ["Country"]

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
        public static let fragmentDefinition: String =
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

        public static let possibleTypes: [String] = ["Country"]

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
        public static let fragmentDefinition: String =
            """
            fragment LanguageCellLanguage on Language {
              __typename
              name
            }
            """

        public static let possibleTypes: [String] = ["Language"]

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
}
