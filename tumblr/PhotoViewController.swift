//
//  PhotoViewController.swift
//  tumblr
//
//  Created by Phillip Pang on 10/11/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit
import SwiftyJSON
import AFNetworking


class PhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableView: UITableView!

    var thePosts:NSArray?


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.codepath.DemoPrototypeCell", for: indexPath) as! DemoPrototypeCell

        let aPost = self.thePosts![indexPath.row ] as? NSDictionary
        let anImage = (aPost?.value(forKeyPath: "photos.original_size.url") as! NSArray)[0] as? String
            
        //print(aPost?["blog_name"] as! String)
 //       cell.tumblrImageView.setImageWith(URL(string: "https://67.media.tumblr.com/0665a1d3e4c58357c2c3dac44801d9cd///tumblr_oewpgx1fby1qggwnvo1_1280.jpg")! )

        cell.tumblrImageView.setImageWith( URL(string: anImage!)!  )

        return cell

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if thePosts == nil { return 0 }
        else {
            return thePosts!.count
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let destinationViewController = segue.destination as! PhotoViewDetailController
        
        let indexPath = tableView.indexPathForSelectedRow
        //let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
        let aImageView = self.tableView.cellForRow(at: indexPath!) as? DemoPrototypeCell

        print ("\n\nPrepare for seque:")
        print( aImageView?.tumblrImageView.image)
        
        destinationViewController.theImage = aImageView?.tumblrImageView.image
    }
    
    func retrieveData() {
        //Making a call to Tumblr
        let apiKey = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(apiKey)")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    //NSLog("response: \(responseDictionary)")
                    
                    var aPost:NSDictionary?
                    
                    //Looping the
                    self.thePosts = responseDictionary.value( forKeyPath: "response.posts") as? NSArray
                    
                    
                    print("\n\nFound Reponse data from API!")
                    
                    
                    /*
                     for aPost in  self.thePosts!{
                     let smallPost = aPost as! NSDictionary
                     print("Post: \(smallPost["summary"])")
                     //  print ("Post: \(aPost[)")
                     }
                     */
                    
                    
                    //self.theResponseData = responseDictionary
                    //let json = JSON(responseDictionary )
                    
                    
                    //reload the table
                    self.tableView.reloadData()
                    
                }
                
                
                
            }
            
        });
        task.resume()
        
        
    }
    
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        self.retrieveData()
        refreshControl.endRefreshing()
        
        print("\nScreen Refreshed")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set Table
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 320
        //tableView.estimatedRowHeight = 320
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        
        //Retrieve the data
        self.retrieveData()
        
        // Initialize a UIRefreshControl
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(refreshControl:)), for: UIControlEvents.valueChanged)
        // add refresh control to table view
        self.tableView.insertSubview(refreshControl, at: 0)
        
        //Test class
        let a : Post = Post(name: "Test", id: 1, type: "A", date: Date(), summary: "test", caption: "aCaption", imagePath: URL(string: "http://www.google.com") )
        
         NSLog(a.blog_name)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

