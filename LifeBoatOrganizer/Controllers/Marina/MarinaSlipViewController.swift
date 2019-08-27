//
//  MarinaSlipViewController.swift
//  LifeBoatOrganizer
//
//  Created by Mahnoor Fatima on 22/06/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking
import Kingfisher


struct MarinaSlip
{
    var path : String
    var MarinaId: Int
   
}
class MarinaSlipViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var id : Int = 1
   var images = [MarinaSlip]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.dataSource = self
        getJSON()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func getJSON() {
        
        SVProgressHUD.show(withStatus: "Requesting...")
        SVProgressHUD.setDefaultMaskType(.black)
        
        let manager = AFHTTPSessionManager()
        manager.get("http://3.104.109.201/BoatApi/Marina/SlipLayout/\(id)", parameters: nil, progress: nil, success: {(operation, responseObject) in
            SVProgressHUD.dismiss()
            let quoteDictionary = responseObject as! Dictionary<String,AnyObject>
            
            let marinas = quoteDictionary["Images"] as? [[String:Any]]
            print(marinas)
            for item in marinas!{
                self.images.append(MarinaSlip.init(path: item["path"] as! String, MarinaId: item["MarinaId"] as! Int))
            }
            print(self.images)
            self.collectionView.reloadData()
            
        }, failure: {
            (operation, error) in
            print("Error: " + error.localizedDescription)
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        })
    }
}

extension MarinaSlipViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! SlipCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
    
        print(self.images[indexPath.row].path)
        let identifier = "..."
        let url = URL(string: "http://3.104.109.201/BoatApi/\(self.images[indexPath.row].path)")!
        print(url)
        let resource = ImageResource(downloadURL: url, cacheKey: nil)
        cell.slipImage.kf.setImage(with: resource)
        
        return cell
    }

}
