//
//  ArtistInfo.swift
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 05/08/2023.
//

import Foundation

@objcMembers
class ArtistInfo: NSObject, Codable {
    public var name: String
    public var bio: ArtistBio
    public var mbid: String?
    var image: [LastFMImage]
    var url: String
}
