//
//  GraphQLProperty.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 25.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import Apollo

@propertyWrapper
struct GraphQL<Value> {
    var wrappedValue: Value

    init(_ path: @autoclosure () -> GraphQLPath<Value>) {
        fatalError("Initializer with path only should never be used")
    }

    init(wrappedValue: Value, _ path: @autoclosure () -> GraphQLPath<Value>) {
        self.wrappedValue = wrappedValue
    }
}

extension GraphQL where Value: Fragment {
    init(_ path: GraphQLFragmentPath<Value.UnderlyingType>) {
        fatalError("Initializer with path only should never be used")
    }

    init(wrappedValue: Value, _ path: GraphQLFragmentPath<Value.UnderlyingType>) {
        self.wrappedValue = wrappedValue
    }
}
