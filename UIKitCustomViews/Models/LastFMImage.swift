//
//  LastFMImage.swift
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 05/08/2023.
//

import Foundation

@objcMembers
class LastFMImage: NSObject, Codable {
    public var id: String {
        url
    }
    public var url: String
    public var size: String
 
    private enum CodingKeys: String, CodingKey {
        case url = "#text", size
    }
}

