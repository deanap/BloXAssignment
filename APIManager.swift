//
//  APIManager.swift
//  Blox
//
//  Created by Dean.apfel on 23/06/2018.
//  Copyright © 2018 Dean.apfel. All rights reserved.
//

import Foundation

class APIManager: NSObject {
  
  static let sharedInstance = APIManager()
  
  
  func getAllRepos(completionHandler:@escaping (_ namesArray:[String])->Void) {
    var arrayNames = [String]()
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://api.github.com/orgs/octokit/repos")! as URL)
    let session = URLSession.shared
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
      if error != nil {
        print("Error: \(String(describing: error))")
      } else {
        do {
          let reposData = try JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
          
          for repo in reposData {
            arrayNames.append(repo["name"] as! String)
          }
          completionHandler(arrayNames)
          
        } catch let error as NSError {
          print(error)
        }
      }
    })
    task.resume()
  }
  
  func getRepoByName(name: String, completionHandler:@escaping (_ repoDetails:[String: Any]) ->Void) {
    let request = NSMutableURLRequest(url: NSURL(string: "https://api.github.com/repos/octokit/" + name)! as URL)
    let session = URLSession.shared
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
      if error != nil {
        print("Error: \(String(describing: error))")
      } else {
        do {
          let details = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
          completionHandler(details)
          
        } catch let error as NSError {
          print(error)
        }
      }
    })
    task.resume()
  }
  
  func deleteRepoByName(name: String) {
    
  }
  
  func updateRepoByName(name: String) {
    
  }
  
  func createNewRepo() {
    
  }
}
