//
//  APIRoute.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import Foundation

protocol APIRouteBuilder {
    var urlString: String { get }
    var baseURL: String { get }
    var path: String { get }
}

enum APIRoute {
    case weatherMap
}

extension APIRoute: APIRouteBuilder {
    var baseURL: String {
        switch self {
        default:
            return "https://openweathermap.org/"
        }
    }
    
    var path: String {
        switch self {
        case .weatherMap:
            return "data/2.5/weather?"
        }
    }

    var urlString: String {
        switch self {
        default:
            return String(format: "%@%@", baseURL, path)
        }
    }
}
