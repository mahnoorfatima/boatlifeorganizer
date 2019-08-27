//
//  QuickViewController.swift
//  LifeBoatOrganizer
//
//  Created by Mahnoor Fatima on 22/06/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit

class QuickViewController: UIViewController {

    @IBOutlet weak var V6: UIView!
    @IBOutlet weak var V5: UIView!
    @IBOutlet weak var V4: UIView!
    @IBOutlet weak var V3: UIView!
    @IBOutlet weak var V2: UIView!
    @IBOutlet weak var v1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        V6.layer.cornerRadius = 22
          v1.layer.cornerRadius = 22
          V2.layer.cornerRadius = 22
         V3.layer.cornerRadius = 22
         V4.layer.cornerRadius = 22
         V5.layer.cornerRadius = 22
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
