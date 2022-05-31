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
            NavigationView {
                GameView(
                    store: Store(
                        initialState: GameState(),
                        reducer: gameReducer,
                        environment: .live
                    )
                )
            }
        }
    }
}
