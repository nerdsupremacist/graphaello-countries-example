//
//  LanguageliistWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct FullLanguageList: View {
    @Countries.Query.Languages var languages: [LanguageCell.Language]?
    
    var body: some View {
        languages.map(LanguageList.init).navigationBarTitle("Languages")
    }
}
