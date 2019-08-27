//
//  DosViewController.swift
//  LifeBoatOrganizer
//
//  Created by Mahnoor Fatima on 22/06/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit

class DosViewController: UIViewController {

    @IBOutlet weak var vv4: UIView!
    @IBOutlet weak var vv3: UIView!
    @IBOutlet weak var vv2: UIView!
    @IBOutlet weak var vv1: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vv4.layer.cornerRadius = 22
        vv3.layer.cornerRadius = 22
        vv2.layer.cornerRadius = 22
        vv1.layer.cornerRadius = 22
      
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
