//
//  GalleryItem.swift
//  FlickrPhotoGallery
//
//  Created by Gianmarco Cotellessa on 06/04/18.
//  Copyright © 2018 Gianmarco Cotellessa. All rights reserved.
//

import Foundation
import UIKit

struct GalleryItem {
    
    let id: String
    let secret: String
    let server: String
    let farm: String
    
    init(id: String, secret: String, server: String, farm: Int) {
        
        self.id = id
        self.secret = secret
        self.server = server
        self.farm = String(farm)
        
    }
    
    func getId() -> String {
        return id
    }
    
    func getUrl() -> URL {
        
        return URL(string: "http://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg")!
        
    }
    
}
