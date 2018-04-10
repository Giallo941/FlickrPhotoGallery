//
//  DetailViewController.swift
//  FlickrPhotoGallery
//
//  Created by Gianmarco Cotellessa on 10/04/18.
//  Copyright © 2018 Gianmarco Cotellessa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = image
        
    }
    
}
