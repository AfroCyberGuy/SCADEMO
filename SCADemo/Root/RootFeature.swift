//
//  RootFeature.swift
//  SCADemo
//
//  Created by Hukastone on 7/4/2022.
//

import ComposableArchitecture

struct RootState{
    
    var dayState = DayState()
}

enum RootAction {
    
    case dayAction(DayAction)
}

struct RootEnvironment{}

let rootReducer = Reducer<
    RootState,
    RootAction,
    SystemEnvironment<RootEnvironment>
    >.combine(
        dayReducer.pullback(
        state: \.dayState,
        action: /RootAction.dayAction,
        environment: { _ in .live(environment:
        DayEnvironment(dayRequest: dayEffect)
        )}
    )
)

