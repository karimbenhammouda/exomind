//
//  Weather.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import Foundation

struct Weather: Decodable {
    let id: Int
    let main: String?
    let description: String?
    let icon: String?
}
