//
//  RepositoryCell.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 26/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(_ viewModel:RepositoryViewModel) {
        self.textLabel?.text = viewModel.description
    }

}
