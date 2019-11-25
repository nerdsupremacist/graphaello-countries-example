//
//  CountryInfo.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryInfo: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Divider()
            Text(value).font(.subheadline).foregroundColor(.gray)
        }
    }
}
