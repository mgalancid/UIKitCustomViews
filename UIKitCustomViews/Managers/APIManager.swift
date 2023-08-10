//
//  APIManager.swift
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 05/08/2023.
//

import Foundation

enum APIError: Error {
    case authenticationError
    case invalidData
    case decodingError
    case networkError
    case unknownError
}

@objcMembers
class APIManager: NSObject {
    private let apiNetwork: APINetwork
    
    init(apiKey: String) {
        apiNetwork = APINetwork(apiKey: apiKey)
    }
    
    func fetchArtistInfo(artistName: String, completion: @escaping (ArtistInfo?, Error?) -> Void) {
        apiNetwork.request(lastFMMethod: "artist.getInfo", args: ["artist": artistName]) { (data: ArtistInfo?, error: Error?) in
            if let error = error {
                print("Error during fetchArtistInfo: \(error)")
                completion(nil, error)
                return
            }
            
            guard let artistInfo = data else {
                let noDataError = NSError(domain: "No hubo datos recibidos", code: 0, userInfo: nil)
                print("No artistInfo received: \(noDataError)")
                completion(nil, noDataError)
                return
            }
            
            completion(artistInfo, nil)
        }
    }
}

//import Foundation
//
//enum APIError: Error {
//    case authenticationError
//    case invalidData
//    case decodingError
//    case networkError
//    case unknownError
//}
//
//@objcMembers
//class APIManager: NSObject {
//    private let apiNetwork: APINetwork
//
//    init(apiKey: String) {
//        apiNetwork = APINetwork(apiKey: apiKey)
//        super.init()
//    }
//
//    func loadUserInfoFromCredentials() -> (username: String?, password: String?) {
//        if let credentialsPath = Bundle.main.path(forResource: "Credentials", ofType: "plist"),
//           let credentials = NSDictionary(contentsOfFile: credentialsPath),
//           let username = credentials["username"] as? String,
//           let password = credentials["password"] as? String {
//            return (username, password)
//        } else {
//            return (nil, nil)
//        }
//    }
//
//    func fetchArtistInfo(artistName: String, completion: @escaping (ArtistInfo?, Error?) -> Void) {
//        let parameters = LastFMAPIParameters()
//        let userInfo = loadUserInfoFromCredentials()
//        parameters.username = userInfo.username
//        parameters.password = userInfo.password
//
//        apiNetwork.fetchAuthToken(with: parameters) { (data: Data?, error: Error?) in
//            if let error = error {
//                print("Error during fetchAuthToken: \(error)")
//                completion(nil, error)
//                return
//            }
//
//            guard let data = data else {
//                let noDataError = NSError(domain: "No hubo datos recibidos", code: 0, userInfo: nil)
//                print("No data received: \(noDataError)")
//                completion(nil, noDataError)
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let artistInfo = try decoder.decode(ArtistInfo.self, from: data)
//                print("Successfully decoded artistInfo: \(artistInfo)")
//                completion(artistInfo, nil)
//            } catch {
//                print("Error decoding artistInfo: \(error)")
//                completion(nil, error)
//            }
//        }
//    }
//}

extension String {
    var md5: String {
        let data = Data(self.utf8)
        let hashData = data.md5()
        return hashData.map { String(format: "%02hhx", $0) }.joined()
    }
}
