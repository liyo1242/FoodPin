//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by mmslab on 2017/1/17.
//  Copyright © 2017年 mmslab. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & tea shop", location:"Hong Kong", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location:"Hong Kong", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location:"Hong Kong", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Cafe Loisl", type: "Austrian / Causual Drink", location:"Hong Kong", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location:"Hong Kong", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location:"Hong Kong", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Chocolate", location:"Hong Kong", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Bakery", type: "Cafe", location:"Hong Kong", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Haight's Choolate", type: "American / seafood", location:"Sydney", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American", location:"Sydney", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location:"Sydney", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "Breakfast & Brunch", location:"New York", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Coffe & Tea", location:"New York", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location:"New York", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Five ster", type: "Latin American", location:"New York", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Cafe LORE", type: "Spanish", location:"New York", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "British", location:"New York", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Thai", location:"London", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "Spanish", location:"London", image: "Apple Wallpaper01.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "British", location:"London", image: "Apple Wallpaper01.jpg", isVisited: false)
        
    ]
    
    var restaurantIsViisited = [Bool](count : 21 , repeatedValue: false)
    //var restaurantImages =[......]
    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return self.restaurantNames.count
    }
    */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let optionMenu = UIAlertController(
            title: nil,
            message: "What do you want to do?",
            preferredStyle: .ActionSheet
        )
        let cancelAction = UIAlertAction(title: "Cancel",style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(
                title: "Service Unavailable",
                message: "Sorry,the call is not available retry later",
                preferredStyle: .Alert
            )
        alertMessage.addAction(UIAlertAction(
            title: "OK",
            style: .Default,
            handler: nil            )
            )
        self.presentViewController(alertMessage, animated: true, completion: nil)
       
        }
       
        let callAction = UIAlertAction(title: "Call" + "123-123-\(indexPath.row)", style: UIAlertActionStyle.Default,handler:callActionHandler)
        
        let isVisitedAction = UIAlertAction(//Closure start
            title: "I`ve been here",
            style:  .Default,
            handler: {(action:UIAlertAction!) -> Void in
            
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                
              
                if(self.restaurantIsViisited[indexPath.row] == false){
                    cell?.accessoryType = .Checkmark
                    self.restaurantIsViisited[indexPath.row] = true
                }else{
                    cell?.accessoryType = .None
                    self.restaurantIsViisited[indexPath.row] = false
                }
            }
        )
        optionMenu.addAction(isVisitedAction)
        optionMenu.addAction(callAction)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
                self.restaurants.removeAtIndex( indexPath.row)
            /*  for test
                println("Total item:\(self.restaurantNames.count)")
                for name in restaurantNames { println(name) }
            */
            
            //self.tableView.reloadData()  no bad
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction] {
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default,title:"Share",handler:{
            (action:UITableViewRowAction!,indexPath:NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil,message: "Share using",preferredStyle:.ActionSheet)
            let twitterAction = UIAlertAction(title:"Twitter",style: UIAlertActionStyle.Default,handler:nil)
            let facebookAction = UIAlertAction(title:"Facebook",style: UIAlertActionStyle.Default,handler:nil)
            let emailAction = UIAlertAction(title:"Email",style: UIAlertActionStyle.Default,handler:nil)
            let cancelAction = UIAlertAction(title:"Cancel",style: UIAlertActionStyle.Cancel,handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            }
        )
        
        let deleteAcion = UITableViewRowAction(style:UITableViewRowActionStyle.Default,title:"delete",handler:{
            (action:UITableViewRowAction,indexPath:NSIndexPath!) ->Void in
            self.restaurants.removeAtIndex( indexPath.row)
        }
    )
        
        shareAction.backgroundColor = UIColor(
            red:255.0/255.0, green:166.0/255.0, blue:51.0/255.0, alpha: 1.0)
        
        return [deleteAcion,shareAction]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath:indexPath) as!CustomTableViewCell
    
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        cell.thumbnailImageView?.image = UIImage(named: "Apple Wallpaper01")
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        if restaurant.isVisited{
            cell.accessoryType = .Checkmark
        }else{
            cell.accessoryType = .None
        }
        //cell?.accessoryType = restaurantIsVisited[indexPath.row] ?  .Checkmark : .None
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if self.tableView.indexPathForSelectedRow != nil{
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.restaurantImage = "Apple Wallpaper01"
            }
        }
    }

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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.restaurants.count
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
