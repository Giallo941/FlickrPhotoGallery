//
//  UrlManager.swift
//  FlickrPhotoGallery
//
//  Created by Gianmarco Cotellessa on 05/04/18.
//  Copyright © 2018 Gianmarco Cotellessa. All rights reserved.
//

import Foundation

class UrlManager {
    
    static let apiKey = "51885ef41dff54033e1de374307f110c"
    static let prefSearchQuery = "searchQuery"
    
    static let endPoint = "https://api.flickr.com/services/rest/"
    static let methodGetRecent = "flickr.photos.getRecent"
    static let methodSearch = "flickr.photos.search"
    
    static func getItemUrl(query: String?, page: Int) -> String {
        var url: String
        
        if (query != nil) {
            url = "\(endPoint)?method=\(methodSearch)&api_key=\(apiKey)&format=json&nojsoncallback=1&text=\(query!)&page=\(page)"
        } else {
            url = "\(endPoint)?method=\(methodGetRecent)&api_key=\(apiKey)&format=json&nojsoncallback=1&page=\(page)"
        }
        
        return url
    }

}
