//
//  GameView.swift
//  TCA
//
//  Created by Henry Fan on 2022/5/31.
//

import SwiftUI
import ComposableArchitecture

struct GameResult: Equatable {
    let secret: Int
    let guess: Int
    let timeSpent: TimeInterval
}

struct GameState: Equatable {
    var counter: Counter = .init()
    var timer: TimerState = .init()
    var results: [GameResult] = []
}

enum GameAction {
    case counter(CounterAction)
    case timer(TimerAction)
}

struct GameEnvironment { }

let gameReducer = Reducer<GameState, GameAction, GameEnvironment>.combine(
    counterReducer.pullback(
        state: \.counter,
        action: /GameAction.counter,
        environment: { _ in .live }
    ),
    timerReducer.pullback(
        state: \.timer,
        action: /GameAction.timer,
        environment: { _ in .live }
    )
)

//struct Reducer<State, Action, Environment> {
//    func pullback<GlobalState, GlobalAction, GlobalEnvironment>(
//        state toLocalState: WritableKeyPath<GlobalState, State>,
//        action toLocalAction: CasePath<GlobalAction, Action>,
//        environment toLocalEnvironment: @escaping (GlobalEnvironment) -> Environment
//    ) -> Reducer<GlobalState, GlobalAction, GlobalEnvironment>
//
//    // ...
//}

struct GameView: View {
    let store: Store<GameState, GameAction>
    
    var body: some View {
        VStack {
            TimerLabelView(store: store.scope(state: \.timer, action: GameAction.timer))
            CounterView(store: store.scope(state: \.counter, action: GameAction.counter))
            
            WithViewStore(store.stateless) { viewStore in
                Color.clear
                    .frame(width: 0, height: 0)
            }
        }
    }
}
