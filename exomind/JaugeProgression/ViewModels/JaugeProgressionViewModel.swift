//
//  JaugeProgressionViewModel.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import Foundation

protocol BanksListViewModelDelegate: AnyObject {
    func updateUI()
}

class JaugeProgressionViewModel {
    private let webServiceClient: WebServiceClient
    
    init() {
        self.webServiceClient = WebServiceClient()
        getData()
    }
    
    func getData() {
        webServiceClient.getWeatherMap(lat: "-1.67429", lon: "48.11198 ") { [self] (finished, weatherInfo)  in
            print(finished)
            print(weatherInfo)
        }
    }
}
