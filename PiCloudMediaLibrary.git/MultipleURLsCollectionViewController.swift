//
//  MultipleURLsCollectionViewController.swift
//  Agrume Example
//

import UIKit

class MultipleURLsCollectionViewController: UICollectionViewController {
    
    fileprivate let identifier = "PhotoCell"
       
    var imagesArray = [ImageWithURL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotoCell
        cell.imageView.image = imagesArray[indexPath.row].image
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let URLs = imagesArray.map { $0.URL }
        /*
        let agrume = Agrume(imageURLs: URLs, startIndex: indexPath.row, backgroundBlurStyle: .ExtraLight)
        agrume.didScroll = {
            [weak self] index in
            self!.collectionView?.scrollToItemAtIndexPath(IndexPath(forRow: index, inSection: 0),
                atScrollPosition: [],
                animated: false)
        }
        agrume.showFrom(self)
        */
    }
    
}
