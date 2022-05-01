//
//  AppManager.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 1/5/22.
//

import Foundation

class AppManager {
    static let sharedInstance = AppManager()
    
    func buildParams() -> [String: Any] {
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = "\(timestamp)\( Constants.privateApiKey)\(Constants.apiKey)".MD5
        
        let params = ["hash": hash , "apikey": Constants.apiKey, "ts": timestamp]
        
        return params
    }
}
