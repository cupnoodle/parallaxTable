//
//  TableViewController.swift
//  parallaxTable
//
//  Created by Soul on 07/06/2016.
//  Copyright © 2016 Sweatshop. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // the top view that contains background image
    @IBOutlet weak var headerHolderView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    

    @IBOutlet weak var favButton: DOFavoriteButton!
    @IBOutlet weak var merchantName: UILabel!
    var tableHeaderView: UIView!
    
    let tableHeaderHeight : CGFloat = 300.0
    let merchantNameLabelOriginY : CGFloat = 210.0
    let favButtonOriginY : CGFloat = 240.0
    
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
        
        // Initialize fav button tag
        favButton.tag = 0
        
        // Initialize dummy data to array
        titleArr = ["Name", "Phone", "Address" , "Lorem Ipsum"]
        descriptionArr = ["Sweatshop", "016-6666666", "SoHo Suites @ KLCC, Jalan Perak, 50450 Kuala Lumpur, Malaysia", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tempor ipsum at massa condimentum, eget cursus nunc auctor. Suspendisse aliquet odio non pellentesque accumsan. Pellentesque ac tortor eu urna auctor pharetra. Duis ante erat, varius sagittis mi faucibus, varius ornare orci. Mauris venenatis justo ut iaculis sagittis. Etiam nec tristique nunc. Fusce lorem sem, pharetra ac sagittis ac, egestas eget nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras nisi leo, auctor vitae tempor finibus, scelerisque in elit. Donec pharetra diam sollicitudin, pharetra erat ac, cursus justo. Suspendisse at ligula sed nisi sodales fringilla. "]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {

        // Initialize position of merchantName label
        merchantName.frame = CGRect(x: 0, y: self.merchantNameLabelOriginY , width: tableView.bounds.width, height: self.merchantName.frame.size.height)
        favButton.frame = CGRect(x: 0, y: self.favButtonOriginY , width: favButton.frame.size.width, height: favButton.frame.size.height)
        
        // center the merchant name
        merchantName.center = CGPointMake(CGRectGetMidX(tableView.bounds), merchantName.center.y);
        
        // center the favButton
        favButton.center = CGPointMake(CGRectGetMidX(tableView.bounds), favButton.center.y);
        
        // Add parallax effect when device is tilted horizontally or vertically for the header image
        
        //http://www.teehanlax.com/blog/introduction-to-uimotioneffect/
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
    
        horizontalMotionEffect.minimumRelativeValue = -15;
        horizontalMotionEffect.maximumRelativeValue = 15;
        verticalMotionEffect.minimumRelativeValue = -15;
        verticalMotionEffect.maximumRelativeValue = 15;
        
        headerImageView.addMotionEffect(horizontalMotionEffect)
        headerImageView.addMotionEffect(verticalMotionEffect)
        
        //[redView addMotionEffect:horizontalMotionEffect];
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // status bar hidden or not
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
        NSLog("the tableview vertical offset is %f", tableView.contentOffset.y)
        
        var headerRect = CGRect(x: 0, y: -tableHeaderHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        if tableView.contentOffset.y < -tableHeaderHeight {
            //print("scrolling up")
            //print("tableview ofset is smaller than header height")
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        tableHeaderView.frame = headerRect
        
        
        let nameRect = CGRect(x: 0, y: tableView.contentOffset.y + tableHeaderHeight + self.merchantNameLabelOriginY , width: tableView.bounds.width, height: self.merchantName.frame.size.height)
        let favRect = CGRect(x: 0, y: tableView.contentOffset.y + tableHeaderHeight + self.favButtonOriginY , width: favButton.frame.size.width, height: favButton.frame.size.height)
        
        merchantName.frame = nameRect
        favButton.frame = favRect
        
        // center the merchant name
        merchantName.center = CGPointMake(CGRectGetMidX(tableView.bounds), merchantName.center.y);
        
        // center the favButton
        favButton.center = CGPointMake(CGRectGetMidX(tableView.bounds), favButton.center.y);
        
    
    }

    @IBAction func favTapped(sender: DOFavoriteButton) {
        if (sender.selected) {
            // deselect
            sender.deselect()
        } else {
            // select with animation
            sender.select()
        }
    }
    
    
}
