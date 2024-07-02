//
//  Screen.swift
//  SharedStackState
//
//  Created by Corey Walo on 7/1/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct Screen {
    @ObservableState
    struct State {
        @Shared var path: StackState<Path.State>
    }
    
    enum Action {
        case push
    }
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
