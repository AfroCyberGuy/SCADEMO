//
//  DayEffects.swift
//  SCADemo
//
//  Created by Hukastone on 7/4/2022.
//

import Foundation
import ComposableArchitecture

func dayEffect(decoder: JSONDecoder) -> Effect<Current, APIError> {
  
    var componentsUrl = URLComponents()
    componentsUrl.scheme = "http"
    componentsUrl.host = "api.openweathermap.org"
    componentsUrl.path = "/data/2.5/weather"

    let queryItems = [
           
               URLQueryItem(name: "lat", value: "-17.774091207648663"),
               URLQueryItem(name: "lon", value: "31.044488038404282"),
               URLQueryItem(name: "units", value: "metric"),
               URLQueryItem(name: "appid", value: "be710cb2719c995a2b50ef0a035471c3")
                ]
    
    componentsUrl.queryItems = queryItems
    
    return URLSession.shared.dataTaskPublisher(for: componentsUrl.url!)
        .mapError { _ in APIError.downloadError }
        .map{ data, _ in data}
        .decode(type: Current.self, decoder: decoder)
        .mapError{ _ in APIError.decodingError}
        .eraseToEffect()
    
    
}



