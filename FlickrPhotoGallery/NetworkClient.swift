//
//  NetworkClient.swift
//  FlickrPhotoGallery
//
//  Created by Gianmarco Cotellessa on 06/04/18.
//  Copyright © 2018 Gianmarco Cotellessa. All rights reserved.
//

import Foundation

class NetworkClient : RetriveElementsInterface {
    
    let query : String
    let page : Int
    
    init(query: String, page: Int) {
        
        self.query = query
        self.page = page
        
    }
    
    func getElements(_ completion: @escaping ([GalleryItem]) -> ()) {
        
        let stringUrl : String = UrlManager.getItemUrl(query: query, page: page)
        
        let url = URL(string: stringUrl)
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
        
            do {
                
                let photos = response?.dictionaryWithValues(forKeys: ["photos"])
                
            } catch let error as NSError {
                
                print(error)
                
            }
            
        }).resume()
            
    }
    
}
