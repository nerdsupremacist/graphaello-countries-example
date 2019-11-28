//
//  CountryListByContinentWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct CountryListForContinentWrapper: View {
    @Countries.Query.Continent var continent: CountryListForContinent.Continent?
    
    var body: some View {
        continent.map(CountryListForContinent.init)
    }
}
