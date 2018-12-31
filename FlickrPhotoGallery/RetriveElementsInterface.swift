//
//  RetriveElementsInterface.swift
//  FlickrPhotoGallery
//
//  Created by Gianmarco Cotellessa on 06/04/18.
//  Copyright © 2018 Gianmarco Cotellessa. All rights reserved.
//

import Foundation

protocol RetriveElementsInterface {
    func getElements(_ completion:  @escaping ([GalleryItem]) -> ())
}
