//
//  NearByCell.swift
//
//  Created by Apple on 29/08/17.
//  Copyright © 2017 Akif. All rights reserved.
//

import UIKit

class NearByCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnTrack: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
