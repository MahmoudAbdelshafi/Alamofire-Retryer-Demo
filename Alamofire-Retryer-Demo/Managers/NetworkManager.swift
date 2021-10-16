//
//  NetworkManager.swift
//  AFRetryRequest
//
//  Created by Mahmoud Abdelshafi on 11/10/2020.


import Alamofire
class NetworkManager {
    static let shared: NetworkManager = {
        return NetworkManager()
    }()
    typealias completionHandler = ((Result<Data, CustomError>) -> Void)
    var request: Alamofire.Request?
    let retryLimit = 3
    let authorize = "https://api.petfinder.com/v2/oauth2/token"
    func authorize(parameters: [String: Any]?, completion: @escaping completionHandler) {
        request?.cancel()
        request = AF.request(authorize, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            if let data = response.data {
                completion(.success(data))
            } else {
                completion(.failure(.unavailableServer))
            }
        }
    }
    
    func request(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil,
                 encoding: ParameterEncoding = URLEncoding.queryString, headers: HTTPHeaders? = nil,
                 interceptor: RequestInterceptor? = nil, completion: @escaping completionHandler) {
        AF.request(url, method: method, parameters: parameters, encoding: encoding,
                   headers: headers, interceptor: interceptor ?? self).validate().responseJSON { (response) in
            if let data = response.data {
                completion(.success(data))
            } else {
                completion(.failure(.unavailableServer))
            }
        }
    }
    
}
