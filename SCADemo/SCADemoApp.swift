//
//  SCADemoApp.swift
//  SCADemo
//
//  Created by Hukastone on 7/4/2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct SCADemoApp: App {
    var body: some Scene {
        WindowGroup {
            DayView(
                store: Store(
                    initialState: RootState(),
                    reducer: rootReducer,
                    environment: .live(environment: RootEnvironment())
                
                )
            )
        }
    }
}
