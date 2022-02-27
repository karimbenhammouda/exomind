//
//  WebService.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import Foundation
import Alamofire

func GetApiRequest(_ urlString: String, _ parameters: [String: Any], _ headers: HTTPHeaders, completion:@escaping (_ finished: Bool, _ response: AnyObject?) ->Void) {
    AF.request(urlString, method: .get, parameters: parameters, encoding:  URLEncoding.queryString, headers: headers).responseData { response in
        switch response.result {
        case .success:
            if let data = response.data {
                completion(true, data as AnyObject?)
            }
        case let .failure(error):
            print(ApiLog.clientError + urlString)
            completion(false, error as AnyObject?)
            return
      }
    }
}
