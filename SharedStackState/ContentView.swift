//
//  ContentView.swift
//  SharedStackState
//
//  Created by Corey Walo on 7/1/24.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    @Bindable var store: StoreOf<AppFeature>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            Button(action: {
                store.send(.push)
            }, label: {
                Text("Push Screen")
            })
        } destination: { store in
            ZStack {
                switch store.state {
                    case .screen:
                        if let store = store.scope(state: \.screen, action: \.screen) {
                            ScreenView(store: store)
                        }
                }
            }
        }

    }
}

struct ScreenView: View {
    @Bindable var store: StoreOf<Screen>
    
    var body: some View {
        Button(action: {
            store.send(.push)
        }, label: {
            Text("Push Screen")
        })
    }
}
