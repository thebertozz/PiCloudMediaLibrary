//
//  MusicTableViewController.swift
//  PiCloudMediaLibrary.git
//
//  Created by Federico Bertoli on 10/11/15.
//  Copyright © 2015 Federico Bertoli. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import SystemConfiguration

class MusicTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var error: NSError?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let audioPlayer = segue.destination as? AVPlayerViewController {
            if let identifier = segue.identifier {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                    do {
                        try AVAudioSession.sharedInstance().setActive(true)
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                switch identifier {
                case "Big Data":
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        audioPlayer.player = AVPlayer(url: PiURL.BigData)
                        } else {
                        
                        audioPlayer.player = AVPlayer(url: PiURLNoIp.BigData)
                    }
                    
                case "Lenny":
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        audioPlayer.player = AVPlayer(url: PiURL.Lenny)
                    } else {
                        
                        audioPlayer.player = AVPlayer(url: PiURLNoIp.Lenny)
                    }

                    
                default: break
                }
            }
        }
        
}
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 16
    }
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
