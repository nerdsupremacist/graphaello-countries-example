//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class FullCountryListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query FullCountryList {
      countries {
        __typename
        ...CountryCell_Country
      }
    }
    """

  public let operationName = "FullCountryList"

  public var queryDocument: String { return operationDefinition.appending(CountryCellCountry.fragmentDefinition).appending(CountryDetailsForBasicWrapperCountry.fragmentDefinition) }

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

      public init(code: String? = nil, name: String? = nil, emoji: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Country", "code": code, "name": name, "emoji": emoji])
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

public final class ContinentListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query ContinentList {
      continents {
        __typename
        ...ContinentCell_Continent
      }
    }
    """

  public let operationName = "ContinentList"

  public var queryDocument: String { return operationDefinition.appending(ContinentCellContinent.fragmentDefinition).appending(CountryListForContinentWrapperContinent.fragmentDefinition) }

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

public final class FullLanguageListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query FullLanguageList {
      languages {
        __typename
        ...LanguageCell_Language
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

      public init(code: String? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Language", "code": code, "name": name])
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

public final class CountryByContinentListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query CountryByContinentList($code: String) {
      continent(code: $code) {
        __typename
        countries {
          __typename
          ...CountryCell_Country
        }
      }
    }
    """

  public let operationName = "CountryByContinentList"

  public var queryDocument: String { return operationDefinition.appending(CountryCellCountry.fragmentDefinition).appending(CountryDetailsForBasicWrapperCountry.fragmentDefinition) }

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
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(countries: [Country?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Continent", "countries": countries.flatMap { (value: [Country?]) -> [ResultMap?] in value.map { (value: Country?) -> ResultMap? in value.flatMap { (value: Country) -> ResultMap in value.resultMap } } }])
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

        public init(code: String? = nil, name: String? = nil, emoji: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Country", "code": code, "name": name, "emoji": emoji])
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

public final class CountryDetailsForCodeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query CountryDetailsForCode($code: String) {
      country(code: $code) {
        __typename
        ...CountryDetailView_Country
      }
    }
    """

  public let operationName = "CountryDetailsForCode"

  public var queryDocument: String { return operationDefinition.appending(CountryDetailViewCountry.fragmentDefinition).appending(ContinentCellContinent.fragmentDefinition).appending(CountryListForContinentWrapperContinent.fragmentDefinition).appending(LanguageCellLanguage.fragmentDefinition) }

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
        GraphQLFragmentSpread(CountryDetailViewCountry.self),
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

        public var countryDetailViewCountry: CountryDetailViewCountry {
          get {
            return CountryDetailViewCountry(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct CountryDetailsForBasicWrapperCountry: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment CountryDetailsForBasicWrapper_Country on Country {
      __typename
      code
    }
    """

  public static let possibleTypes = ["Country"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("code", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(code: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Country", "code": code])
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
}

public struct CountryCellCountry: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment CountryCell_Country on Country {
      __typename
      ...CountryDetailsForBasicWrapper_Country
      name
      emoji
    }
    """

  public static let possibleTypes = ["Country"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLFragmentSpread(CountryDetailsForBasicWrapperCountry.self),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("emoji", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(code: String? = nil, name: String? = nil, emoji: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Country", "code": code, "name": name, "emoji": emoji])
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

  public var emoji: String? {
    get {
      return resultMap["emoji"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "emoji")
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

    public var countryDetailsForBasicWrapperCountry: CountryDetailsForBasicWrapperCountry {
      get {
        return CountryDetailsForBasicWrapperCountry(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }
  }
}

public struct CountryDetailViewCountry: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment CountryDetailView_Country on Country {
      __typename
      code
      name
      native
      phone
      currency
      emoji
      continent {
        __typename
        ...ContinentCell_Continent
      }
      languages {
        __typename
        ...LanguageCell_Language
      }
    }
    """

  public static let possibleTypes = ["Country"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("code", type: .scalar(String.self)),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("native", type: .scalar(String.self)),
    GraphQLField("phone", type: .scalar(String.self)),
    GraphQLField("currency", type: .scalar(String.self)),
    GraphQLField("emoji", type: .scalar(String.self)),
    GraphQLField("continent", type: .object(Continent.selections)),
    GraphQLField("languages", type: .list(.object(Language.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(code: String? = nil, name: String? = nil, native: String? = nil, phone: String? = nil, currency: String? = nil, emoji: String? = nil, continent: Continent? = nil, languages: [Language?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "Country", "code": code, "name": name, "native": native, "phone": phone, "currency": currency, "emoji": emoji, "continent": continent.flatMap { (value: Continent) -> ResultMap in value.resultMap }, "languages": languages.flatMap { (value: [Language?]) -> [ResultMap?] in value.map { (value: Language?) -> ResultMap? in value.flatMap { (value: Language) -> ResultMap in value.resultMap } } }])
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

    public init(code: String? = nil, name: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Language", "code": code, "name": name])
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

public struct CountryListForContinentWrapperContinent: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment CountryListForContinentWrapper_Continent on Continent {
      __typename
      code
    }
    """

  public static let possibleTypes = ["Continent"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("code", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(code: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Continent", "code": code])
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
}

public struct ContinentCellContinent: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment ContinentCell_Continent on Continent {
      __typename
      ...CountryListForContinentWrapper_Continent
      name
    }
    """

  public static let possibleTypes = ["Continent"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLFragmentSpread(CountryListForContinentWrapperContinent.self),
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

    public var countryListForContinentWrapperContinent: CountryListForContinentWrapperContinent {
      get {
        return CountryListForContinentWrapperContinent(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }
  }
}

public struct LanguageCellLanguage: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment LanguageCell_Language on Language {
      __typename
      code
      name
    }
    """

  public static let possibleTypes = ["Language"]

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
    self.init(unsafeResultMap: ["__typename": "Language", "code": code, "name": name])
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