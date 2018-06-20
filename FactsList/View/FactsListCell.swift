//
//  FactsListCell.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/19/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import SDWebImage

class FactsListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    @IBOutlet weak var factsImage: UIImageView!
    

    func displayFacts(factsList: FactsList) {
        titleLabel?.text = factsList.title
        describtionLabel?.text = factsList.describtion
        factsImage.sd_setImage(with: URL(string: factsList.imageURL), placeholderImage: UIImage(named: "placeholder.png"))
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
