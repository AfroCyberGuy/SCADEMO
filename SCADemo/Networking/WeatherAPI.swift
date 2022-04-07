//
//  WeatherAPI.swift
//  SCADemo
//
//  Created by Hukastone on 7/4/2022.
//

import Foundation
import UIKit

enum WeatherAPI {

    enum APIPath: String{
        
        case currentWeatherPath = "/data/2.5/weather"
        case weatherFocustPath  = "/data/2.5/forecast"
    }
    
    enum APIComponentsPath: String{
        
        case scheme = "http"
        case host   =  "api.openweathermap.org"
    }
    
    enum HttpMethods: String {
        
        case POST = "POST"
        case GET  = "GET"
    }

}
