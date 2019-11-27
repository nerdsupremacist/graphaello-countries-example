//
//  QueryRenderer.swift
//  GraphQLTest
//
//  Created by Mathias Quintero on 23.11.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import SwiftUI
import Apollo

let client = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)

struct QueryRenderer<Query: GraphQLQuery, Content: View>: View {
    typealias ContentFactory = (Query.Data) -> Content

    let query: Query
    let factory: ContentFactory
    
    @State private var isLoading: Bool = false
    @State private var value: Query.Data? = nil
    @State private var error: String? = nil
    @State private var cancellable: Cancellable? = nil
    
    var body: some View {
        return VStack {
            error.map { Text("Error: \($0)") }
            value.map(factory)
            isLoading ? Text("Loading") : nil
        }.onAppear {
            self.cancellable = client.fetch(query: self.query) { result in
                defer {
                    self.cancellable = nil
                    self.isLoading = false
                }
                switch result {
                case .success(let result):
                    self.value = result.data
                    self.error = result.errors?.map { $0.description }.joined(separator: ", ")
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }
            self.isLoading = true
        }.onDisappear {
            self.cancellable?.cancel()
        }
    }
}
