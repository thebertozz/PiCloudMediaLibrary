//
//  YearsTableViewController.swift
//  PiCloudMediaLibrary.git
//
//  Created by Federico Bertoli on 05/11/15.
//  Copyright © 2015 Federico Bertoli. All rights reserved.
//

import UIKit

// MARK: - YearsTableViewController

class YearsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        showAlert()
        

    }


    // MARK: - YearsTableViewController

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ivc = segue.destination as? MultipleURLsCollectionViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    
                case "2006":
                    ivc.title = "Foto scattate nel 2006"
                                        
                    if UIDevice.current.userInterfaceIdiom == .pad {
                    ivc.imagesArray = PiURL.imagesFor2006
                    } else {
                        ivc.imagesArray = PiURLNoIp.imagesFor2006
                    }
                case "2007":
                    ivc.title = "Foto scattate nel 2007"
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        ivc.imagesArray = PiURL.imagesFor2007
                    } else {
                        
                        ivc.imagesArray = PiURLNoIp.imagesFor2007
                    }

                case "2008":
                    ivc.title = "Foto scattate nel 2008"
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        
                        ivc.imagesArray = PiURL.imagesFor2008
                    } else {
                        
                        ivc.imagesArray = PiURLNoIp.imagesFor2008
                    }

                case "2009":
                    ivc.title = "Foto scattate nel 2009"
                    

                    if UIDevice.current.userInterfaceIdiom == .pad {
                        
                        ivc.imagesArray = PiURL.imagesFor2009
                    } else {
                        
                        ivc.imagesArray = PiURLNoIp.imagesFor2009
                    }
                case "2010":
                    ivc.title = "Foto scattate nel 2010"
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        
                        ivc.imagesArray = PiURL.imagesFor2010
                    } else {
                        
                        ivc.imagesArray = PiURLNoIp.imagesFor2010
                    }

                case "2011":
                    ivc.title = "Foto scattate nel 2011"
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                       
                        ivc.imagesArray = PiURL.imagesFor2011
                    } else {
                    
                        ivc.imagesArray = PiURLNoIp.imagesFor2011
                    }

                case "2012":
                    ivc.title = "Foto scattate nel 2012"
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                       
                        ivc.imagesArray = PiURL.imagesFor2012
                    } else {
                       
                        ivc.imagesArray = PiURLNoIp.imagesFor2012
                    }

                case "2013":
                    ivc.title = "Foto scattate nel 2013"
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                      
                        ivc.imagesArray = PiURL.imagesFor2013
                    } else {
                      
                        ivc.imagesArray = PiURLNoIp.imagesFor2013
                    }
                case "2014":
                    ivc.title = "Foto scattate nel 2014"
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        
                        ivc.imagesArray = PiURL.imagesFor2014
                    } else {
                      
                        ivc.imagesArray = PiURLNoIp.imagesFor2014
                    }

                case "2015":
                    ivc.title = "Foto scattate nel 2015"
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                       
                        ivc.imagesArray = PiURL.imagesFor2015
                    } else {
                      
                        ivc.imagesArray = PiURLNoIp.imagesFor2015
                    }
                default: break
                }
            }
        }
    }
    
    fileprivate func showAlert() {
        
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Accesso al server",message: "Inserisci username e password",
            preferredStyle: .alert)
        
        alertController!.addTextField(
            configurationHandler: {(textField: UITextField!) in
                textField.placeholder = "Username:"
        })
        
        alertController!.addTextField(
            configurationHandler: {(textField: UITextField!) in
                textField.placeholder = "Password:"
                textField.isSecureTextEntry = true
        })
        
        
        let action = UIAlertAction(title: "Invia",
            style: UIAlertActionStyle.default,
            handler: {[weak self]
                (paramAction:UIAlertAction!) in
                if let textFields = alertController?.textFields{
                    let theTextFields = textFields as [UITextField]
                    let defaults = UserDefaults.standard
                    defaults.set(theTextFields[0].text, forKey: "Username")
                    defaults.set(theTextFields[1].text,forKey: "Password")
                    defaults.synchronize()
                }
            })
        
        
        alertController?.addAction(action)
        self.present(alertController!,
            animated: true,
            completion: nil)
        
        return

    
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
