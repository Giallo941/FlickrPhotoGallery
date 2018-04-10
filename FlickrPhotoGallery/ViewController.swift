//
//  ViewController.swift
//  FlickrPhotoGallery
//
//  Created by Gianmarco Cotellessa on 05/04/18.
//  Copyright © 2018 Gianmarco Cotellessa. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var txtSearchBar: UISearchBar!
    
    var url = UrlManager.getItemUrl(query: nil, page: 1)
//    var result = NetworkClient(query: "bird", page: 1)
    var items: [GalleryItem] = []
    
    var isSearching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoading(query: nil)
        
        txtSearchBar.delegate = self
        
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
        let imageView = UIImageView()
        imageView.sd_setImage(with: items[indexPath.row].getUrl())
        cell.imageView.image = imageView.image
        
        return cell
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearching = false
            
            view.endEditing(true)
            
            collectionView.reloadData()
            
        } else {
            
            startLoading(query: searchBar.text)
            
            isSearching = true
            
            //TODO: call a Func
            
            collectionView.reloadData()
            
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        txtSearchBar.endEditing(true)
        
    }
    
    func startLoading(query: String?) {
        
        let result = NetworkClient(query: query, page: 1)
        
        result.getElements { (elements) in
            
            self.items = elements
            
            self.collectionView.reloadData()
            
        }
        
    }
    
}

