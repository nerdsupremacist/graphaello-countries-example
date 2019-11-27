//
//  ContinentListWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct ContinentListWrapper: View {

    var body: some View {
        QueryRenderer(query: ContinentListQuery()) { data in
            ContinentList(continents: data.continents?.compactMap { $0?.fragments.continentCellContinent } ?? [])
        }.navigationBarTitle("Continents")
    }

}
