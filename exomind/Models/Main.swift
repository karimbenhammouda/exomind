//
//  Main.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import Foundation

struct Main: Decodable {
    let temp: Double?
    let feels_like: [Weather]
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Double?
    let humidity: Double?
}
