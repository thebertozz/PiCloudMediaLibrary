//
//  Globals.swift
//  PiCloudMediaLibrary.git
//
//  Created by Federico Bertoli on 17/11/15.
//  Copyright © 2015 Federico Bertoli. All rights reserved.
//

import Foundation
import UIKit

let defaults = UserDefaults.standard

var username = defaults.object(forKey: "Username") as! String
var password = defaults.object(forKey: "Password") as! String


struct ImageWithURL {
    var image: UIImage?
    var URL: Foundation.URL
}

enum UIUserInterfaceIdiom : Int {
    case unspecified
    
    case phone
    case pad
}
