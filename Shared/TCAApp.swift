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
            AngelView()
            
//            NavigationView {
//                GameView(
//                    store: Store(
//                        initialState: testState,
//                        reducer: gameReducer,
//                        environment: .live
//                    )
//                )
//            }
        }
    }
}
