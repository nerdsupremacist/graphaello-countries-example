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
      self.resultMap = unsafeResultMap
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
        self.resultMap = unsafeResultMap
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
          self.resultMap = unsafeResultMap
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
          self.resultMap = unsafeResultMap
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
            self.resultMap = unsafeResultMap
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
          self.resultMap = unsafeResultMap
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
            self.resultMap = unsafeResultMap
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
      self.resultMap = unsafeResultMap
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
        self.resultMap = unsafeResultMap
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
          self.resultMap = unsafeResultMap
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
            self.resultMap = unsafeResultMap
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

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("continents", type: .list(.object(Continent.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
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
        self.resultMap = unsafeResultMap
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
          self.resultMap = unsafeResultMap
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

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("countries", type: .list(.object(Country.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
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
        self.resultMap = unsafeResultMap
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
          self.resultMap = unsafeResultMap
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

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("languages", type: .list(.object(Language.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
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
        self.resultMap = unsafeResultMap
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
          self.resultMap = unsafeResultMap
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
    self.resultMap = unsafeResultMap
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
    self.resultMap = unsafeResultMap
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
    self.resultMap = unsafeResultMap
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
    self.resultMap = unsafeResultMap
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
