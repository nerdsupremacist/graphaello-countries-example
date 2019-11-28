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

public struct Countries {
    let client: ApolloClient
    
    public enum Query {
        static let continents = GraphQLFragmentPath<[Continent]?>()

        static let countries = GraphQLFragmentPath<[Country]?>()

        static let languages = GraphQLFragmentPath<[Language]?>()

        static let continent = GraphQLFragmentPath<Continent?>()

        static let country = GraphQLFragmentPath<Country?>()

        static let language = GraphQLFragmentPath<Language?>()
        
        static func continent(code: GraphQLArgument<String?>) -> GraphQLFragmentPath<Continent?> {
            return GraphQLFragmentPath()
        }
        
        static func country(code: GraphQLArgument<String?>) -> GraphQLFragmentPath<Country?> {
            return GraphQLFragmentPath()
        }
        
        static func language(code: GraphQLArgument<String?>) -> GraphQLFragmentPath<Language?> {
            return GraphQLFragmentPath()
        }
    }

    public enum Country {
        static let name = GraphQLPath<String?>()
        
        static let native = GraphQLPath<String?>()
        
        static let code = GraphQLPath<String?>()
        
        static let emoji = GraphQLPath<String?>()
        
        static let phone = GraphQLPath<String?>()
        
        static let currency = GraphQLPath<String?>()
        
        static let continent = GraphQLFragmentPath<Continent?>()

        static let languages = GraphQLFragmentPath<[Language]?>()

        static let fragment = GraphQLFragmentPath<Country>()
    }

    public enum Continent {
        static let name = GraphQLPath<String?>()

        static let code = GraphQLPath<String?>()
        
        static let countries = GraphQLFragmentPath<[Country]?>()

        static let fragment = GraphQLFragmentPath<Continent>()
    }

    public enum Language {
        static let name = GraphQLPath<String?>()
        
        static let native = GraphQLPath<String?>()
        
        static let code = GraphQLPath<String?>()
        
        static let rtl = GraphQLPath<Int?>()

        static let fragment = GraphQLFragmentPath<Language>()
    }
}
