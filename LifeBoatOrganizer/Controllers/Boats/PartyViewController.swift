//
//  PartyViewController.swift
//  LifeBoatOrganizer
//
//  Created by Mahnoor Fatima on 22/06/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {
    @IBOutlet weak var vvv4: UIView!
    @IBOutlet weak var vvv3: UIView!
    @IBOutlet weak var vvv2: UIView!
    @IBOutlet weak var vvv1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vvv4.layer.cornerRadius = 22
        vvv3.layer.cornerRadius = 22
        vvv2.layer.cornerRadius = 22
        vvv1.layer.cornerRadius = 22
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
