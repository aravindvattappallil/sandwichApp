//
//  sw2App.swift
//  sw2
//
//  Created by Aravind Vattappallil on 2023-01-25.
//

import SwiftUI

@main
struct sw2App: App {
    @StateObject private var store = SandwichStore.testSandwichStore
    var body: some Scene {
        WindowGroup {
            SandwichesListView(viewModel:SandwichesListViewModel())
        }
    }
}
