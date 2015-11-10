//
//  MultipleURLsCollectionViewController.swift
//  Agrume Example
//

import UIKit
import Agrume

final class MultipleURLsCollectionViewController: UICollectionViewController {

    private let identifier = "Cell"

    private struct ImageWithURL {
        let image: UIImage
        let URL: NSURL
    }

    private let images = [
        ImageWithURL(image: UIImage(), URL: NSURL(string: "http://192.168.0.21:9021/pictures/1.jpg")!),
        ImageWithURL(image: UIImage(imageLiteral: "2.jpg"), URL: NSURL(string: "http://192.168.0.21:9021/pictures/2.jpg")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: CGRectGetWidth(view.bounds), height: CGRectGetHeight(view.bounds))
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! DemoCell
        cell.imageView.image = images[indexPath.row].image
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let URLs = images.map { $0.URL }
        let agrume = Agrume(imageURLs: URLs, startIndex: indexPath.row, backgroundBlurStyle: .ExtraLight)
        agrume.didScroll = {
            [unowned self] index in
            self.collectionView?.scrollToItemAtIndexPath(NSIndexPath(forRow: index, inSection: 0),
                    atScrollPosition: [],
                    animated: false)
        }
        agrume.showFrom(self)
    }

}
