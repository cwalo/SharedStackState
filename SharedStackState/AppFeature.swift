//
//  AppFeature.swift
//  SharedStackState
//
//  Created by Corey Walo on 7/1/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct AppFeature {
    @ObservableState
    struct State {
        @Shared var path: StackState<Path.State>
        
        init() {
            _path = Shared(StackState<Path.State>())
        }
    }
    
    enum Action {
        case path(StackAction<Path.State, Path.Action>)
        case push
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case let .path(.element(id: _, action: screenAction)):
                    switch screenAction {
                        case .screen(.push):
                            state.path.append(Path.State.screen(Screen.State(path: state.$path)))
                            return .none
                    }
                case .path:
                    return .none
                case .push:
                    state.path.append(Path.State.screen(Screen.State(path: state.$path)))
                    return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}
