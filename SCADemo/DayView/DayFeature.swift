//
//  DayFeature.swift
//  SCADemo
//
//  Created by Hukastone on 7/4/2022.
//

import ComposableArchitecture

struct DayState: Equatable{
    
    var day: Current?
}

enum DayAction: Equatable{
    
    case onAppear
    case weatherDataLoaded(Result<Current, APIError>)
}


struct DayEnvironment {
    
    var dayRequest: (JSONDecoder) -> Effect<Current, APIError>
}

let dayReducer = Reducer<
    DayState,
    DayAction,
    SystemEnvironment<DayEnvironment>
>{ state, action, environment in
    
    switch action {
        
    case .onAppear:
        
        return environment.dayRequest(environment.decoder())
            .receive(on: environment.mainQueue())
            .catchToEffect()
            .map(DayAction.weatherDataLoaded)
        
    case .weatherDataLoaded(let result):
        
        switch result{
            
        case .success(let dayData):
            state.day = dayData
            
        case .failure:
            break
        }
        
        return .none
        
    }
    
    
}





