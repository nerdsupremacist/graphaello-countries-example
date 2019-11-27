//
//  Countries.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 25.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import Apollo

struct Countries {
    let client: ApolloClient
    
    enum Query {
        @propertyWrapper
        struct Continents<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Countries<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Languages<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Continent<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: Fragment?

            public init(wrappedValue: Fragment?, code: GraphQLArgument<String?>) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Country<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: Fragment?

            public init(wrappedValue: Fragment?, code: GraphQLArgument<String?>) {
                self.wrappedValue = wrappedValue
            }
        }
        
        @propertyWrapper
        struct Language<Fragment: GraphQLFragment>: GraphQLProperty {
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

        // TODO: constraint to valid fragments
        @propertyWrapper
        struct Continent<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: Fragment?

            public init(wrappedValue: Fragment?) {
                self.wrappedValue = wrappedValue
            }
        }

        // TODO: constraint to valid fragments
        @propertyWrapper
        struct Languages<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }

        // TODO: constraint to valid fragments
        @propertyWrapper
        struct Fragment<Fragment: GraphQLFragment>: GraphQLProperty {
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

        // TODO: constraint to valid fragments
        @propertyWrapper
        struct Countries<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: [Fragment]?

            public init(wrappedValue: [Fragment]?) {
                self.wrappedValue = wrappedValue
            }
        }

        // TODO: constraint to valid fragments
        @propertyWrapper
        struct Fragment<Fragment: GraphQLFragment>: GraphQLProperty {
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

        // TODO: constraint to valid fragments
        @propertyWrapper
        struct Fragment<Fragment: GraphQLFragment>: GraphQLProperty {
            public var wrappedValue: Fragment

            public init(wrappedValue: Fragment) {
                self.wrappedValue = wrappedValue
            }
        }
    }
}
