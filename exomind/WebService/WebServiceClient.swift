//
//  WebServiceClient.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import Foundation

class WebServiceClient {
    func getWeatherMap(lat: String, lon: String, completion: @escaping (Bool, WeatherInfo?) -> Void) {
        let parameters = [Constants.ApiGetParametres.lat: lat, Constants.ApiGetParametres.lon: lon, Constants.ApiGetParametres.appid: Constants.ApiHeader.apiKey]
        
        GetApiRequest(APIRoute.weatherMap.urlString, parameters, [], completion: { (finished, response) in
            if(finished)
            {
                do {
                    if let data = response as? Data {
                        let decoder = JSONDecoder()
                        let weatherInfo = try decoder.decode(WeatherInfo.self, from: data)
                        completion(true, weatherInfo)
                    }
                } catch {
                    print(String.init(format: ApiLog.jsonErrorDeserializing,"\(error.localizedDescription)"))
                }
            }
            else {
                print(ApiLog.serverError)
                completion(false, nil)
            }
        })
    }
}

