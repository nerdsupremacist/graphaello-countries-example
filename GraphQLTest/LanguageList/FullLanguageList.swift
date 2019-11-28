//
//  FullLanguageList.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct FullLanguageList: View {
    @GraphQL(Countries.languages)
    var languages: [LanguageCell.Language]?
    
    var body: some View {
        languages
            .map { languages in
                List(languages, id: \.name) { language in
                    LanguageCell(language: language)
                }
            }
            .navigationBarTitle("Languages")
    }
}
