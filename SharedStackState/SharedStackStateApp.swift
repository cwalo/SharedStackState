//
//  SharedStackStateApp.swift
//  SharedStackState
//
//  Created by Corey Walo on 7/1/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct SharedStackStateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: AppFeature.State(), reducer: {
                AppFeature()
                    ._printChanges()
            }))
        }
    }
}
