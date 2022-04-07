//
//  CurrentWeather.swift
//  SCADemo
//
//  Created by Hukastone on 7/4/2022.
//

import Foundation

struct Current: Decodable, Equatable {
 

        var weather: [Weather]?
        var base: String?
        var main: Main?
        var visibility: Int?
        var dt: Int?
        var timezone: Int?
        var id: Int?
        var name: String?
        var cod: Int?
    }
   
    // MARK: - Main
    struct Main: Decodable, Equatable {
        var temp: Double?
        var feelsLike: Double?
        var tempMin: Double?
        var tempMax: Double?
        var pressure: Int?
        var humidity: Int?
        var seaLevel: Int?
        var grndLevel: Int?

        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure, humidity
            case seaLevel = "sea_level"
            case grndLevel = "grnd_level"
        }
    }

    
    // MARK: - Weather
    struct Weather: Decodable, Equatable{
        var id: Int?
        var main: String?
        var weatherDescription: String?
        var icon: String?

        enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
            case icon
        }
    }
