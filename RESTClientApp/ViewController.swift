//
//  ViewController.swift
//  RESTClientApp
//
//  Created by Sarah-Jessica Jemitola on 08/02/2016.
//  Copyright © 2016 Tobi and Sons. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var uri = "https://heromongonode.herokuapp.com/getallusers"
    var arrayDict = [[String:AnyObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayDict.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        var dict = arrayDict[indexPath.row]
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["email"] as? String
        return cell
    }

    @IBAction func refreshBttn(sender: UIButton) {
        Alamofire.request(.GET, uri).responseJSON{response in
            let swiftyJsonVar = JSON(response.result.value!)
            if let resData = swiftyJsonVar.arrayObject{
                self.arrayDict = resData as! [[String:AnyObject]]
            }
            self.tableView.reloadData()
            
            
        }

    }
}

