//
//  GraphQLFragmentPath.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 28.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public struct GraphQLFragmentPath<UnderlyingType> { }

extension GraphQLFragmentPath {

    var fragment: GraphQLFragmentPath<UnderlyingType> {
        return self
    }

}
