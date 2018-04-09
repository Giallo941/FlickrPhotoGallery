//
//  ViewController.swift
//  FlickrPhotoGallery
//
//  Created by Gianmarco Cotellessa on 05/04/18.
//  Copyright © 2018 Gianmarco Cotellessa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var url = UrlManager.getItemUrl(query: nil, page: 1)
    
    var result = NetworkClient(query: "bird", page: 1)
    
    let array:[String] = ["1","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2"]
    
    var items: [GalleryItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.getElements { (elements) in
            
            self.items = elements
    
            self.collectionView.reloadData()
            
        }
        
        let itemSize = UIScreen.main.bounds.width/3 - 1
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        collectionView.collectionViewLayout = layout
        
    }

    //Number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    //Populate view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: array[indexPath.row] + ".jpg")
        return cell
        
    }
    
}

