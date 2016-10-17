//
//  PhotoViewDetailControllerViewController.swift
//  tumblr
//
//  Created by Phillip Pang on 10/15/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoViewDetailController: UIViewController {

    var theImage: UIImage!
    
    @IBOutlet weak var theImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        theImageView.image = theImage!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
