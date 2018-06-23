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
  var jsonString = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

      APIManager.sharedInstance.getRepoByName(name: repoName!, completionHandler: { (repoDetailsDict) in
        self.jsonString = repoDetailsDict.description
        print(self.jsonString)
      })
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
    repoDetailsTextView.text = jsonString
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
