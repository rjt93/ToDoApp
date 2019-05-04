//
//  TodoListTableViewCell.swift
//  ToDoApp
//
//  Created by Rajat on 04/05/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
