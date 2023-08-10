//
//  APINetwork.swift
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 05/08/2023.
//


import Foundation
import CryptoSwift

class APINetwork {
    
    private let apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func request<T: Decodable>(lastFMMethod: String, args: [String: String] = [:], callback: @escaping (T?, Error?) -> Void) {
        let baseURLString = "https://ws.audioscrobbler.com/2.0/"
        guard var components = URLComponents(string: baseURLString) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            callback(nil, error as Error)
            return
        }
        
        var queryItems = args.map { URLQueryItem(name: $0.key, value: $0.value) }
        queryItems.append(URLQueryItem(name: "method", value: lastFMMethod))
        queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        
        components.queryItems = queryItems
        
        guard let requestURL = components.url else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            callback(nil, error as Error)
            return
        }
        
        var request = URLRequest(url: requestURL)
        
        let data: Data = "".data(using: .utf8)! // You need to create the data to be sent
        
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        
        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            
            if let data = data {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Response JSON: \(jsonString)")
                }
            }
            
            var callbackData: T?
            var callbackError: Error?
            
            do {
                if let response = response as? HTTPURLResponse {
                    NSLog("status code of request %@: %ld", lastFMMethod, response.statusCode)
                    if response.statusCode != 200 {
                        let error = NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Invalid API response. Please try again"])
                        callback(callbackData, error as Error)
                        return
                    }
                }
                
                if let nsHTTPResponse = response as? HTTPURLResponse {
                    NSLog("status code of request %@: %ld", lastFMMethod, nsHTTPResponse.statusCode)
                }
                
                if let data = data {
                    let jsonResponse = try JSONDecoder().decode(T.self, from: data)
                    callbackData = jsonResponse
                }
            } catch {
                NSLog("Error during request %@: %@", lastFMMethod, error.localizedDescription)
                callbackError = error
            }
            
            callback(callbackData, callbackError)
        }
        .resume()
    }
    
    private func generateAPISignature(toSign: String) -> String {
        let concatenatedString = "\(toSign)\(apiKey)"
        let hash = concatenatedString.data(using: .utf8)?.md5() // Generate MD5 hash as Data
        let hashBytes = hash?.bytes // Convert Data to [UInt8]
        
        if let hashBytes = hashBytes {
            let hashString = hashBytes.map { String(format: "%02hhx", $0) }.joined()
            return hashString
        } else {
            return "" // Handle error case
        }
    }
}
