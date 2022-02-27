//
//  WeatherInfo.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import Foundation

struct WeatherInfo: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Double?
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int?
    let id: Int?
    let name: String?
    let cod: Int?
}
