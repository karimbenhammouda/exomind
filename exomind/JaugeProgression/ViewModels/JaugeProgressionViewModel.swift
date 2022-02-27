//
//  JaugeProgressionViewModel.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import Foundation

protocol JaugeProgressionViewModelDelegate: AnyObject {
    func updateUI()
}

class JaugeProgressionViewModel {
    private let webServiceClient: WebServiceClient
    private var index: Int = 1
    
    weak var delegate: JaugeProgressionViewModelDelegate?
    let mapsCity = [[["lat":"48.117266"], ["lon":"-1.6777926"]], [["lat":"48.856614"], ["lon":"2.3522219"]], [["lat":"47.218371"], ["lon":"-1.553621"]], [["lat":"44.837789"], ["lon":"-0.57918"]], [["lat":"45.764043"], ["lon":"4.835659"]]]
    var indexMapsCity = 0
    var waitCity: [WeatherInfo?] = []
    let waitUser = [Constants.waitUser.download, Constants.waitUser.almostDone, Constants.waitUser.aFewSeconds]
    
    init() {
        self.webServiceClient = WebServiceClient()
    }
    
    func getData(_ latitude: String?, _ longitude: String?) {
        guard let latitude = latitude, let longitude = longitude else {
            return 
        }
        webServiceClient.getWeatherMap(lat: latitude, lon: longitude) { [self] (finished, weatherInfo)  in
            if finished {
                waitCity.append(weatherInfo)
                if waitCity.count == mapsCity.count {
                    delegate?.updateUI()
                }
            }
        }
    }
    
    func waitUserText() -> String {
        index = index == waitUser.count - 1 ? 0 : index + 1
        return waitUser[index]
    }
}
