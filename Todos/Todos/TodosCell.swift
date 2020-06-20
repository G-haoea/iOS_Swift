//
//  TodosCell.swift
//  Todos
//
//  Created by Grace Liu on 19/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit

/// For cell which has checkLabel and textLabel
class TodosCell: UITableViewCell {
    

    @IBOutlet weak var todoCheckLabel: UILabel!
    @IBOutlet weak var todoTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
