//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Álvaro Sanz Rodrigo on 19/12/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {


    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var imageViewCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
