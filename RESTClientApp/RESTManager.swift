//
//  RESTManager.swift
//  RESTClientApp
//
//  Created by Sarah-Jessica Jemitola on 08/02/2016.
//  Copyright © 2016 Tobi and Sons. All rights reserved.
//

import Foundation
typealias RESTServiceResponse = (JSON, NSError?) -> Void

class RESTManager: NSObject {
    static let sharedInstance = RESTManager()
    let baseURL = ""
    
    func getRandomUser(onCompletion: (JSON) -> Void) {
        let route = baseURL
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func makeHTTPGetRequest(path: String, onCompletion: RESTServiceResponse){
        let url = NSURL(string: path)
        let request = NSMutableURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json: JSON = JSON(data: data!)
            onCompletion(json, error)
        
        })
        
        task.resume()
    }
}
