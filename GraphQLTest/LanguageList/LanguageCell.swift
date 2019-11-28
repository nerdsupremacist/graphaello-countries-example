//
//  LanguageCell.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct LanguageCell: View {
    @GraphQL(Countries.Language.name)
    var name: String? = nil
    
    var body: some View {
        name.map { Text($0) }
    }
}
