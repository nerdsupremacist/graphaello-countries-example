//
//  LanguageliistWrapper.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 24.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import SwiftUI

struct FullLanguageList: View {
    @GraphQL(Countries.Query.languages())
    var languages: [LanguageCell.Language]?
    
    var body: some View {
        languages.map(LanguageList.init).navigationBarTitle("Languages")
    }
}

struct ToggleTextButton: View {
  @Binding var isOn: Bool
  var body: some View {
    Button(
      action: { self.isOn.toggle() },
      label: { Text(self.isOn ? "Hide" : "Show") }
    )
  }
}

func test() {
}
