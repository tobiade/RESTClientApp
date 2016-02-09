//
//  ViewController2.swift
//  RESTClientApp
//
//  Created by Sarah-Jessica Jemitola on 09/02/2016.
//  Copyright © 2016 Tobi and Sons. All rights reserved.
//

import UIKit
import Alamofire
class ViewController2: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var userAgeField: UITextField!
    
    var uri = "https://heromongonode.herokuapp.com/adduser"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addUserBtn(sender: UIButton) {
        let username = userNameField.text!
        let useremail = userEmailField.text!
        let userage = userAgeField.text!
        let parameters = ["username":username,"useremail":useremail,"userage":userage]
        Alamofire.request(.POST, uri, parameters:parameters)
        
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
