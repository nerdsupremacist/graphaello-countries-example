//
//  GraphQLArgument.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 27.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

enum GraphQLArgument<Value> {
    case value(Value)
    case argument
}
