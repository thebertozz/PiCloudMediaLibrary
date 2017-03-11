//
//  ImagesViewController.swift
//  PiCloudMediaLibrary.git
//
//  Created by Federico Bertoli and suzuki_keishi on 12/11/15.
//  Copyright © 2015 Federico Bertoli and suzuki_keishi. All rights reserved.
/*


import UIKit
import SKPhotoBrowser
import Kingfisher

var images = [SKPhoto]()

class ImagesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imagesURL: String = ""
    var images = [SKPhoto]()
    let cache = KingfisherManager.sharedManager.cache
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView(){
       collectionView.delegate = self
       collectionView.dataSource = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("ViewWillDisappear")
        cache.clearMemoryCache()
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        cache.clearMemoryCache()
        
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("exampleCollectionViewCell", forIndexPath: indexPath) as! ExampleCollectionViewCell
        
        let urlStringComesFromWeb = imagesURL + "\(indexPath.row+1).jpg"
        
        let photo = SKPhoto.photoWithImageURL(urlStringComesFromWeb)
        images.append(photo)
     
        cell.setExampleImageViewFromURL(urlStringComesFromWeb)
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ExampleCollectionViewCell
        let originImage = cell.exampleImageView.image!
        let browser = SKPhotoBrowser(originImage: originImage, photos: images, animatedFromView: cell)
        browser.initializePageIndex(indexPath.row)
        //browser.delegate = self
        presentViewController(browser, animated: true, completion: {})
    }
    
}


class ExampleCollectionViewCell:UICollectionViewCell{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exampleImageView.image = nil
    }
    
    override func prepareForReuse() {
        exampleImageView.image = nil
    }
    
    @IBOutlet weak var exampleImageView: UIImageView!

    func setExampleImageViewFromURL(url: String){
        print ("chiamata setExampleImageView")
        self.exampleImageView.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: nil, optionsInfo: [.Transition(ImageTransition.Fade(1))])
                return
    }
}
*/
