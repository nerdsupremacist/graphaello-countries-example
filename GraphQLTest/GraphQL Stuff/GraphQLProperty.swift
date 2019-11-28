//
//  GraphQLProperty.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 25.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import Apollo

public protocol Fragment {
    associatedtype UnderlyingType
}

public struct GraphQLPath<Value> { }

public struct GraphQLFragmentPath<UnderlyingType> { }

extension GraphQLFragmentPath {

    var fragment: GraphQLFragmentPath<UnderlyingType> {
        return self
    }

}

@propertyWrapper
public struct GraphQL<Value> {
    public var wrappedValue: Value

    public init(_ path: GraphQLPath<Value>) {
        fatalError("Initializer with path only should never be used")
    }

    public init(wrappedValue: Value, _ path: GraphQLPath<Value>) {
        self.wrappedValue = wrappedValue
    }
}

extension GraphQL where Value: Fragment {
    public init(_ path: GraphQLFragmentPath<Value.UnderlyingType>) {
        fatalError("Initializer with path only should never be used")
    }

    public init(wrappedValue: Value, _ path: GraphQLFragmentPath<Value.UnderlyingType>) {
        self.wrappedValue = wrappedValue
    }
}

extension Array: Fragment where Element: Fragment {
    public typealias UnderlyingType = [Element.UnderlyingType]
}

extension Optional: Fragment where Wrapped: Fragment {
    public typealias UnderlyingType = Wrapped.UnderlyingType?
}
