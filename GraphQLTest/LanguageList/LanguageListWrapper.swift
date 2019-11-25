//
//  LanguageliistWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct LanguageListWrapper: View {
    var body: some View {
        QueryRenderer(query: FullLanguageListQuery()) { data in
            LanguageList(languages: data.languages?.compactMap { $0?.fragments.basicLanguage } ?? [])
        }.navigationBarTitle("Languages")
    }
}
