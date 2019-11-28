// This file will be autogenerated in the future and should not be edited

//
//  Countries.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 25.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import Apollo

protocol CountriesCountryFragment : GraphQLFragment { }
protocol CountriesContinentFragment : GraphQLFragment { }
protocol CountriesLanguageFragment : GraphQLFragment { }

struct Countries {
    let client: ApolloClient
    
    enum Query {
        @propertyWrapper
        struct Continents<Fragment: CountriesContinentFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Countries<Fragment: CountriesCountryFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Languages<Fragment: CountriesLanguageFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Continent<Fragment: CountriesContinentFragment>: GraphQLProperty {
            public var wrappedValue: Fragment?

            public init(wrappedValue: Fragment?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Country<Fragment: CountriesCountryFragment>: GraphQLProperty {
            public var wrappedValue: Fragment?

            public init(wrappedValue: Fragment?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Language<Fragment: CountriesLanguageFragment>: GraphQLProperty {
            public var wrappedValue: Fragment?

            public init(wrappedValue: Fragment?, code: GraphQLArgument<String?>) {
                self.wrappedValue = wrappedValue
            }
        }
    }

    enum Country {
        @propertyWrapper
        struct Name: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Native: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Code: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Emoji: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Phone: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Currency: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Continent<Fragment: CountriesContinentFragment>: GraphQLProperty {
            public var wrappedValue: Fragment?

            public init(wrappedValue: Fragment?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Languages<Fragment: CountriesLanguageFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Fragment<Fragment: CountriesCountryFragment>: GraphQLProperty {
            public var wrappedValue: Fragment

            public init(wrappedValue: Fragment) {
                self.wrappedValue = wrappedValue
            }
        }
    }

    enum Continent {
        @propertyWrapper
        struct Name: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Code: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Countries<Fragment: CountriesCountryFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Fragment<Fragment: CountriesContinentFragment>: GraphQLProperty {
            public var wrappedValue: Fragment

            public init(wrappedValue: Fragment) {
                self.wrappedValue = wrappedValue
            }
        }
    }

    enum Language {
        @propertyWrapper
        struct Name: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Code: GraphQLProperty {
            public var wrappedValue: String?

            public init(wrappedValue: String?) {
                self.wrappedValue = wrappedValue
            }
        }

        @propertyWrapper
        struct Fragment<Fragment: CountriesLanguageFragment>: GraphQLProperty {
            public var wrappedValue: Fragment

            public init(wrappedValue: Fragment) {
                self.wrappedValue = wrappedValue
            }
        }
    }
}