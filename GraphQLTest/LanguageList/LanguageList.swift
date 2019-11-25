//
//  LanguageList.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct LanguageList: View {
    let languages: [BasicLanguage]
    
    var body: some View {
        List(languages, id: \.code) { language in
            LanguageCell(language: language)
        }.listStyle(GroupedListStyle())
    }
}
