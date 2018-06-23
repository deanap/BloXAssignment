//
//  RepoDetailsViewController.swift
//  Blox
//
//  Created by Dean.apfel on 23/06/2018.
//  Copyright © 2018 Dean.apfel. All rights reserved.
//

import UIKit

class RepoDetailsViewController: UIViewController {
  
  @IBOutlet weak var repoDetailsTextView: UITextView!
  var repoName: String?
  
    override func viewDidLoad() {
        super.viewDidLoad()

      APIManager.sharedInstance.getRepoByName(name: repoName!, completionHandler: { (repoDetailsDict) in
        print(repoDetailsDict)
        
        var selectedArray = [Any](repoDetailsDict.values)
        
//        for index in 0..<selectedArray.count {
//          repoDetailsTextView.text += selectedArray[index]
//        }
      })
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
