//
//  ServiceProxy.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//

import Foundation
import Alamofire



public enum APIError: Error {
    case system(Error)
    case undefined(String)
    case invalidResponse
    case notFound
    case unableToDecode(String)
    case emptyResponse
}

class ServiceProxy {
    
    private let session: URLSession
    
    private let mainUrl = "https://gateway.marvel.com:443/"
    
    init() {
        self.session = .shared
    }
    
    func getItem<T: Decodable>(url: String, type: T.Type, parameters: [String:Any]?,headers: HTTPHeaders? = nil, queue: DispatchQueue = .main, completion: @escaping (Result<T, AFError>) -> Void) {
        let url = "\(mainUrl)\(url)"
        let request =  AF.request(url, method: .get, parameters: parameters, headers: headers)
        .validate()
        .responseDecodable(of: T.self, queue: queue) { (response) in
            print("IN<---------------------------------------")
            if let HTTPresponse = response.response {
                // Debug
                print(HTTPresponse)
            } else {
                print(response)
            }
            print("IN<---------------------------------------")
            
            if let data = response.data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        if request.isInitialized {
            request.cURLDescription(calling: { (description) in
                print("OUT----------------------------->")
                print("Curl Description \(description)")
                print("--------------------------------->")
            })
            
        }
    }
}
