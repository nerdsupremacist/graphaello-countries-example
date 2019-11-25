//
//  Countries.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 25.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import Apollo
import SwiftUI

struct Countries {
    let client: ApolloClient
    
    func countries<Fragment: GraphQLFragment, Content: View>(body: @escaping ([Fragment]) -> Content) -> some View {
        return QueryRenderer(client: client, query: CountriesQuery<Fragment>()) { body($0.countries?.compactMap { $0 } ?? []) }
    }
    
    @propertyWrapper
    struct Country<Value>: GraphQLType {
        public var wrappedValue: Value
        
        public init(wrappedValue: Value) {
            self.wrappedValue = wrappedValue
        }
    }
    
    @propertyWrapper
    struct Continent<Value>: GraphQLType {
        public var wrappedValue: Value
        
        public init(wrappedValue: Value) {
            self.wrappedValue = wrappedValue
        }
    }
    
    @propertyWrapper
    struct Language<Value>: GraphQLType {
        public var wrappedValue: Value
        
        public init(wrappedValue: Value) {
            self.wrappedValue = wrappedValue
        }
    }
}

public final class CountriesQuery<Fragment: GraphQLFragment>: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query {
      countries {
        __typename
        ...\(Fragment.self)
      }
    }
    """

  public let operationName = "FullCountryList"

  public var queryDocument: String { return operationDefinition.appending(Fragment.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    
    public static var possibleTypes: [String] {
        return ["Query"]
    }

    public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("countries", type: .list(.object(Fragment.selections))),
        ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var countries: [Fragment?]? {
        return (resultMap["countries"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Fragment?] in value.map { (value: ResultMap?) -> Fragment? in value.flatMap { (value: ResultMap) -> Fragment in Fragment(unsafeResultMap: value) } } }
    }
  }
}
