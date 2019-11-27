//
//  ContinentListWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct FullContinentList: View {
    @Countries.Query.Continents var continents: [ContinentCell.Continent]?

    var body: some View {
        continents.map(ContinentList.init).navigationBarTitle("Continents")
    }
}
