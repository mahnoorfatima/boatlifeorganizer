//
//  InventoryViewController.swift
//  LifeBoatOrganizer
//
//  Created by Mahnoor Fatima on 22/06/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit
struct Videos {
    var title : String
    var description : String
    var image : String
    
}
class InventoryViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var colView: UICollectionView!
    var video = [
        Videos(title: "Title of Video", description : "Many modern alternative often incorporate humor and other content that actualy deracts from looks" , image : "videoss"),
        Videos(title: "Title of Video", description : "Many modern alternative often incorporate humor and other content that actualy deracts from looks" , image : "videoss"),
         Videos(title: "Title of Video", description : "Many modern alternative often incorporate humor and other content that actualy deracts from looks" , image : "videoss"),
        Videos(title: "Title of Video", description : "Many modern alternative often incorporate humor and other content that actualy deracts from looks" , image : "videoss"),
        
        
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        colView.delegate  = self
        colView.dataSource = self
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
extension InventoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  4    }
    
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 70
//    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "vcell", for: indexPath)
        
       
//        cell.clipsToBounds = true
//        cell.vtitle.text = self.video[indexPath.row].title
//          cell.vdesc.text = self.video[indexPath.row].description
//          cell.vimage.image =  UIImage(named:self.video[indexPath.row].image) 
//        print(indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "boat")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension InventoryViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pcell", for: indexPath) as! PhotoCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.pcell.image = UIImage(named:"boat")
        return cell
    }
    
}
