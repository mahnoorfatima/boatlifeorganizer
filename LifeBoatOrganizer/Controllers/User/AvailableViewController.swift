//
//  AailableMarinaViewController.swift
//  LifeBoatOrganizer
//
//  Created by Mahnoor Fatima on 20/06/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking
struct Marina {
    var title : String
    
}
struct Marin
{
var Id : Int
var Name: String
var Latitude: Double
var Longitude: Double
}

class MarinaCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
class AvailableViewController:UIViewController {
    var name = ""
      var data = [Marin]()
    let cellReuseIdentifier = "FeelingCell"
    let cellSpacingHeight: CGFloat = 5
    @IBOutlet weak var tablView: UITableView!
    var marina = [
        Marina(title: "Ontario Place"),
        Marina( title: "Marina 1"),
        Marina(title: "Marina 2"),
        Marina(title: "Marina 3"),
 
        ]
    var roundButton = UIButton()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablView.delegate = self
        tablView.dataSource = self
        getJSON()
        tablView.tableFooterView = UIView()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tablView.indexPathForSelectedRow{
            self.tablView.deselectRow(at: index, animated: true)
        }
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
      
        if roundButton.superview != nil {
            DispatchQueue.main.async {
                self.roundButton.removeFromSuperview()
                
            }
        }
    }
   
    func createFloatingButton() {
        roundButton = UIButton(type: .custom)
        roundButton.translatesAutoresizingMaskIntoConstraints = false
        roundButton.backgroundColor = UIColor.init(red: 1, green: 74, blue: 110, alpha: 0.1)
        roundButton.setBackgroundImage(UIImage(named:"back"), for: .normal)
     
        
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(self.roundButton)
                NSLayoutConstraint.activate([
                    keyWindow.trailingAnchor.constraint(equalTo: self.roundButton.trailingAnchor, constant: 25),
                    keyWindow.bottomAnchor.constraint(equalTo: self.roundButton.bottomAnchor, constant: 50),
                    self.roundButton.widthAnchor.constraint(equalToConstant: 100),
                    self.roundButton.heightAnchor.constraint(equalToConstant: 45)])
            }
            
            self.roundButton.layer.cornerRadius = 9.5
            self.roundButton.layer.shadowColor = UIColor.black.cgColor
            self.roundButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            self.roundButton.layer.masksToBounds = false
            self.roundButton.layer.shadowRadius = 2.0
            self.roundButton.layer.shadowOpacity = 0.5
            let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.duration = 0.4
            scaleAnimation.repeatCount = .greatestFiniteMagnitude
            scaleAnimation.autoreverses = true
            scaleAnimation.fromValue = 1.0;
            scaleAnimation.toValue = 1.05;
            self.roundButton.layer.add(scaleAnimation, forKey: "scale")
            
        }
    }
    func getJSON() {
        
        SVProgressHUD.show(withStatus: "Requesting...")
        SVProgressHUD.setDefaultMaskType(.black)

        let manager = AFHTTPSessionManager()
        manager.get("http://3.104.109.201/boatapi/Marina/Search/\(name)", parameters: nil, progress: nil, success: {(operation, responseObject) in
            SVProgressHUD.dismiss()
            let quoteDictionary = responseObject as! Dictionary<String,AnyObject>
            
            let marinas = quoteDictionary["Marinas"] as? [[String:Any]]
            for item in marinas!{
                self.data.append(Marin.init(Id: item["Id"] as! Int, Name: item["Name"] as! String, Latitude: item["Latitude"] as! Double, Longitude: item["Longitude"] as! Double))
            }
            self.tablView.reloadData()
            print(self.data.count)
          
        }, failure: {
            (operation, error) in
            print("Error: " + error.localizedDescription)
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        })
    }
}


extension AvailableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeelingCell", for: indexPath) as!MarinaCell
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
    
        cell.lblName.text = self.data[indexPath.row].Name as? String
        print(indexPath.row)
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "boat") as! FindBoatViewController
      
        vc.id = self.data[indexPath.row].Id
        vc.lat = self.data[indexPath.row].Latitude
        vc.long = self.data[indexPath.row].Longitude
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

