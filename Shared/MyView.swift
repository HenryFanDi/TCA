//
//  MyView.swift
//  TCA
//
//  Created by Henry Fan on 2022/5/31.
//

import SwiftUI
import ComposableArchitecture

struct MyState: Equatable {
    @BindableState var foo: Bool = false
    @BindableState var bar: String = ""
}

enum MyAction: BindableAction {
    case binding(BindingAction<MyState>)
}

struct MyEnvironment { }

let myReducer = Reducer<MyState, MyAction, MyEnvironment> {
    state, action, _ in
    switch action {
    case .binding:
        return .none
    }
}.binding()

struct MyView: View {
    let store: Store<MyState, MyAction>
    var body: some View {
        WithViewStore(store) { viewStore in
            Toggle("Toggle!", isOn: viewStore.binding(\.$foo))
            TextField("Text Field!", text: viewStore.binding(\.$bar))
        }
    }
}
