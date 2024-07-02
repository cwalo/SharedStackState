//
//  Path.swift
//  SharedStackState
//
//  Created by Corey Walo on 7/1/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct Path {
    @ObservableState
    enum State {
        case screen(Screen.State)
    }
    
    enum Action {
        case screen(Screen.Action)
    }
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
            .ifCaseLet(\.screen, action: \.screen) {
                Screen()
            }
    }
}

