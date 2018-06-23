//
//  ReposTableViewCell.swift
//  Blox
//
//  Created by Dean.apfel on 23/06/2018.
//  Copyright © 2018 Dean.apfel. All rights reserved.
//

import UIKit

class ReposTableViewCell: UITableViewCell {

  @IBOutlet weak var repoNameLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
