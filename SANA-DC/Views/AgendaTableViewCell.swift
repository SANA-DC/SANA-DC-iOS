//
//  AgendaTableViewCell.swift
//  SANA-DC
//
//  Created by Saleem Sangi on 10/11/17.
//  Copyright © 2017 Saleem Sangi. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var starttime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
