//
//  GameView.swift
//  TCA
//
//  Created by Henry Fan on 2022/5/31.
//

import SwiftUI
import ComposableArchitecture

struct GameResult: Equatable, Identifiable {
    let counter: Counter
    let timeSpent: TimeInterval
    
    var correct: Bool { counter.secret == counter.count }
    var id: UUID { counter.id }
}

struct GameState: Equatable {
    var counter: Counter = .init()
    var timer: TimerState = .init()
    
    var results = IdentifiedArrayOf<GameResult>()
    var lastTimestamp = 0.0
}

enum GameAction {
    case counter(CounterAction)
    case timer(TimerAction)
    case listResult(GameResultListAction)
}

struct GameEnvironment {
    var generateRandom: (ClosedRange<Int>) -> Int
    var uuid: () -> UUID
    var date: () -> Date
    var mainQueue: AnySchedulerOf<DispatchQueue>
    
    static let live = GameEnvironment(
        generateRandom: Int.random,
        uuid: UUID.init,
        date: Date.init,
        mainQueue: .main
    )
}

let gameReducer = Reducer<GameState, GameAction, GameEnvironment>.combine(
    .init { state, action, environment in
        switch action {
        case .counter(.playNext):
            let result = GameResult(
                counter: state.counter,
                timeSpent: state.timer.duration - state.lastTimestamp
            )
            state.results.append(result)
            state.lastTimestamp = state.timer.duration
            return .none
        default:
            return .none
        }
    },
    counterReducer.pullback(
        state: \.counter,
        action: /GameAction.counter,
        environment: { _ in .live }
    ),
    timerReducer.pullback(
        state: \.timer,
        action: /GameAction.timer,
        environment: { _ in .live }
    ),
    gameResultListReducer.pullback(
        state: \.results,
        action: /GameAction.listResult,
        environment: { _ in .init() }
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
        WithViewStore(store.scope(state: \.results)) { viewStore in
            VStack {
                resultLabel(viewStore.state.elements)
                Divider()
                TimerLabelView(store: store.scope(state: \.timer, action: GameAction.timer))
                CounterView(store: store.scope(state: \.counter, action: GameAction.counter))
            }.onAppear {
                viewStore.send(.timer(.start))
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Detail") {
                    GameResultListView(store: store.scope(state: \.results, action: GameAction.listResult))
                }
            }
        }
    }
    
    func resultLabel(_ results: [GameResult]) -> some View {
        Text("Result: \(results.filter(\.correct).count)/\(results.count) correct")
    }
}
