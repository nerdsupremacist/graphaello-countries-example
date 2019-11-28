//
//  GraphQLProperty.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 25.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import Apollo

public struct GraphQLPath<Value> { }

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

@propertyWrapper
public struct Fragment<Value: GraphQLFragment> {
    public var wrappedValue: Value
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}
