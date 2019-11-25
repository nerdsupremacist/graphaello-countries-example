//
//  LanguageCell.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct LanguageCell: View {
    let language: BasicLanguage
    
    var body: some View {
        language.name.map { Text($0) }
    }
}
