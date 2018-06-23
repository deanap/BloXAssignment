//
//  MainViewController.swift
//  Blox
//
//  Created by Dean.apfel on 23/06/2018.
//  Copyright © 2018 Dean.apfel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var createRepoButton: UIButton!
  @IBOutlet weak var reposTableView: UITableView!
  
  var repoNames: [String]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    reposTableView.delegate = self
    reposTableView.dataSource = self
    
    APIManager.sharedInstance.getAllRepos(completionHandler: { (namesArray) in
      self.repoNames = namesArray
      self.reposTableView.reloadData()
    })
  }

  // MARK: - TableView
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if repoNames != nil {
      return repoNames.count
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ReposTableViewCell = tableView.dequeueReusableCell(withIdentifier: "repoCell") as! ReposTableViewCell
    if repoNames != nil {
      cell.repoNameLabel.text = repoNames[indexPath.row]
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedRow = repoNames[indexPath.row]
    tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    performSegue(withIdentifier: "showDetailsSegue", sender: selectedRow)
  }
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let vc = segue.destination as? RepoDetailsViewController {
        vc.repoName = sender as? String
      }
    }
  
  // MARK: - Create Repo
  @IBOutlet weak var createNewRepo: UIButton!
  
}
