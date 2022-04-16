//
//  TrackResponse.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation


struct Response : Decodable {
    var resultCount : Int?
    var results : [TrackResponse]?
}

struct TrackResponse : Decodable {
    var artistId : Int?
    var artistName :String?
    var artistViewUrl : String?
    var artworkUrl100: String
    var releaseDate : String?
    var trackCensoredName : String?
    var trackId : Int?
    var trackName : String?
    var trackPrice : Double?
    
}
