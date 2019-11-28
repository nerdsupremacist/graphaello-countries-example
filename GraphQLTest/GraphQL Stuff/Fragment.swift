//
//  Fragment.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 28.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public protocol Fragment {
    associatedtype UnderlyingType
}

extension Array: Fragment where Element: Fragment {
    public typealias UnderlyingType = [Element.UnderlyingType]
}

extension Optional: Fragment where Wrapped: Fragment {
    public typealias UnderlyingType = Wrapped.UnderlyingType?
}
