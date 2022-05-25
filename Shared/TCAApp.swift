//
//  TCAApp.swift
//  Shared
//
//  Created by Henry Fan on 2022/5/20.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(
                store: Store(
                    initialState: Counter(),
                    reducer: counterReducer,
                    environment: .live
                )
            )
        }
    }
}
