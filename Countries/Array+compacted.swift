//
//  Array+compacted.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 09.12.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Optional {
    
    func compactMap<V, T>(_ transform: ([V]) throws -> T) rethrows -> T? where Wrapped == [V?] {
        return try map { values in
            return try transform(values.compactMap { $0 })
        }
    }
    
}
