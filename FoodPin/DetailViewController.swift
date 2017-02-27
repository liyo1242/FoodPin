//
//  DetailViewController.swift
//  FoodPin
//
//  Created by mmslab on 2017/2/20.
//  Copyright © 2017年 mmslab. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //var restaurant: Restaurant! // Restaurant must be empty
    
    @IBOutlet var DetailText: UITextField!
    @IBOutlet var DetailLabel: UILabel!
    @IBAction func DetailButton(sender: AnyObject) {
        
        DetailLabel.text = DetailText.text
    }
    
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurantImage:String!

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
   var restaurant : Restaurant!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailTableViewCell
    
                switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text =  restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes,I've bee here" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
       
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.restaurantImageView.image = UIImage(named: "Apple Wallpaper01")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
