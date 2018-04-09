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

        let urlString : String = UrlManager.getItemUrl(query: query, page: page)
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
        
            do {
                
                let resultDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                
                guard let photosContainer = resultDictionary!["photos"] as? NSDictionary else { return }
                guard let photosArray = photosContainer["photo"] as? [NSDictionary] else { return }
                
                let flickrPhotos: [GalleryItem] = photosArray.map { photoDictionary in
                    
                    let id = photoDictionary["id"] as? String ?? ""
                    let secret = photoDictionary["secret"] as? String ?? ""
                    let server = photoDictionary["server"] as? String ?? ""
                    let farm = photoDictionary["farm"] as? String ?? ""
                    
                    let galleryItem = GalleryItem(id: id, secret: secret, server: server, farm: farm)
                    
                    return galleryItem
                    
                }
                
                DispatchQueue.main.async {
                    
                     completion(flickrPhotos)
                    
                }
                
            } catch let error as NSError {
                
                print("error parsing Json: \(error)")
                
                return
                
            }
            
        }).resume()
            
    }

}

