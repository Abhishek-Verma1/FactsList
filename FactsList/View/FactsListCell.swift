//
//  FactsListCell.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/19/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class FactsListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    @IBOutlet weak var factsImage: UIImageView!
    

    func displayFacts(factsList: List) {
        titleLabel?.text = factsList.title
        describtionLabel?.text = factsList.describtion
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
