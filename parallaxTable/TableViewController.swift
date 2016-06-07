//
//  TableViewController.swift
//  parallaxTable
//
//  Created by Soul on 07/06/2016.
//  Copyright © 2016 Sweatshop. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let tableHeaderHeight : CGFloat = 250.0
    
    var tableHeaderView: UIView!
    
    var titleArr: [String] = []
    var descriptionArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Dynamic height for each row
        tableView.estimatedRowHeight = 65.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Configure table header to reference with tableHeaderView variable
        tableHeaderView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        
        // Push down the table content by the height of tableHeaderHeight
        tableView.addSubview(tableHeaderView)
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        updateTableHeaderView()
        
        
        // Initialize dummy data to array
        titleArr = ["Name", "Phone", "Address" , "Lorem Ipsum"]
        descriptionArr = ["Sweatshop", "016-6666666", "SoHo Suites @ KLCC, Jalan Perak, 50450 Kuala Lumpur, Malaysia", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tempor ipsum at massa condimentum, eget cursus nunc auctor. Suspendisse aliquet odio non pellentesque accumsan. Pellentesque ac tortor eu urna auctor pharetra. Duis ante erat, varius sagittis mi faucibus, varius ornare orci. Mauris venenatis justo ut iaculis sagittis. Etiam nec tristique nunc. Fusce lorem sem, pharetra ac sagittis ac, egestas eget nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras nisi leo, auctor vitae tempor finibus, scelerisque in elit. Donec pharetra diam sollicitudin, pharetra erat ac, cursus justo. Suspendisse at ligula sed nisi sodales fringilla. "]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArr.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MerchantTableViewCell
        
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.descriptionLabel.text = descriptionArr[indexPath.row]

        // Configure the cell...

        return cell
    }
 

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
    
    // MARK: - Scroll View Delegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateTableHeaderView()
    }
    
    // MARK: - Controller specific functions
    func updateTableHeaderView() {
        var headerRect = CGRect(x: 0, y: -tableHeaderHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        if tableView.contentOffset.y < -tableHeaderHeight {
            print("scrolling down")
            print("tableview ofset is smaller than header height")
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        tableHeaderView.frame = headerRect
    }

}
