//
//  ImageViewController.swift
//  PiCloudMediaLibrary.git
//
//  Created by Federico Bertoli on 05/11/15.
//  Copyright © 2015 Federico Bertoli. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    //variabile per la gestione dell'array di immagini per lo swipe
    
    var imagesIndex = 0
    
    //Outlet per la gestione dello spinner
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //Action per la gestione dello swipe, per scorrere le immagini
    
    @IBAction func handleSwipe(sender: UISwipeGestureRecognizer) {
     
        
        let swipeDirection = sender.direction
        
        switch swipeDirection {
        case UISwipeGestureRecognizerDirection.Left:
            imagesIndex--; print("Left")
        case UISwipeGestureRecognizerDirection.Right:
            imagesIndex++; print("Right")
        default: break
        }
        imagesIndex = (imagesIndex < 0) ? (images.count-1): imagesIndex % images.count
        imageView.image = images[imagesIndex]
    
    }
    
   
    //Outlet per la gestione della ScrollView
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.3
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    //Impostazioni di zooming per la ScrollView
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    //Creazione della istanza della ImageView, si può fare anche da storyboard
    
    private var imageView = UIImageView()
    
    //Computed property per la gestione dell'URL
    //se l'immagine non è su schermo non viene caricata
    
    var imageURL = [NSURL?]()
    
    /*
    didSet {
            image = nil
            if view.window != nil {
            fetchImages(counter: 0)
            }
        }
    */
    
    //Array per contenere le immagini caricate dalla funzione fetchImages
    
    var images = [UIImage?]()


    //Computed property per la gestione dell'immagine
    
    private var image: UIImage? {
        get {
            //imageView.image = images[imagesIndex]
            return imageView.image
        }
        set {
            images.append(newValue)
            imageView.image = images[imagesIndex]
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    //Funzione per il caricamento dell'immagine dall'URL fornito
    
    private func fetchImages(counter URLCounter: Int) {
        
    if let url = imageURL[URLCounter] {
        spinner?.startAnimating()
        let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
        dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
            let imageData = NSData(contentsOfURL: url)
            dispatch_async(dispatch_get_main_queue()) {
                    if url == self.imageURL[URLCounter] {
                if imageData != nil {
                    self.image = UIImage(data: imageData!)
                    
                    print("images.count:\(self.images.count)")
                    } //else {
                        //self.imagesIndex.
                    //}
                }
            }
        }
    }
}
    
    //funzione per caricare l'array images con le immagini dai vari url 
    
    func loadImagesArray() {
     
        for var i = 0; i<3; ++i {
            print("i:\(i)")
            fetchImages(counter: i)
        }
    }
    
    
    
    //Se esco e torno nella ImageView e l'immagine è nil, la carico
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if images.isEmpty {
            //fetchImages(counter: 0, imagesArray: &images)
            loadImagesArray()
        }
    }
    
    //Funzioni di default 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        imageView.sizeToFit()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
