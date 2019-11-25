//
//  ContinentCell.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct ContinentCell: View {
    let continent: BasicContinent
    
    var body: some View {
        NavigationLink(destination: CountryListForContinentWrapper(continent: continent)) {
            HStack {
                continent.name.map { Text($0) }
            }
        }
    }
}
