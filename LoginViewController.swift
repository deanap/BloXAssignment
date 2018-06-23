//
//  ViewController.swift
//  Blox
//
//  Created by Dean.apfel on 23/06/2018.
//  Copyright © 2018 Dean.apfel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var errorMessage: UILabel!
  @IBOutlet weak var loginButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func LoginToApp(_ sender: Any) {
    //allowing to login only when both username and password are not empty
    if !(userNameTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! {
      let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let mainViewController = storyBoard.instantiateViewController(withIdentifier: "mainViewController") as! MainViewController
      self.show(mainViewController, sender: self)
    } else {
      errorMessage.isHidden = false
    }
  }
  
}

