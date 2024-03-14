//
//  TableViewCell.swift
//  FlagCatalog
//
//  Created by Rodrigo Cavalcanti on 14/03/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var flag: UIImageView!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
