//
//  NetworkOperation.swift
//  AuTouch
//
//  Created by Jared Morgan on 10/18/15.
//  Copyright © 2015 Jared Morgan. All rights reserved.
//

import Foundation

class NetworkOperation {
    lazy var config: NSURLSessionConfiguration =
        NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession =
        NSURLSession(configuration: self.config)
    let queryURL: NSURL
    let authToken: String
    
    typealias JSONDictionaryCompletion = [String: AnyObject]? -> Void
    
    init(url: NSURL, authToken: String) {
        self.queryURL = url
        self.authToken = authToken
    }
    
    func post(params: Dictionary<String, AnyObject>) -> Void {
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: queryURL)
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(
                params, options: NSJSONWritingOptions.PrettyPrinted
            )
            request.HTTPMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        } catch {
            print("Error:\n \(error)")
            return
        }
        
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
        }
        
        dataTask.resume()
    }
}