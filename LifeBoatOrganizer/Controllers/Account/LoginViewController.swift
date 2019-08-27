//
//  LoginViewController.swift
//  LifeBoatOrganizer
//
//  Created by Mahnoor Fatima on 22/06/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.hideKeyboardWhenTappedAround()
        let emailImage = UIImage(named:"email")
       
        addLeftImageTo(txtField: txtEmail, andImage: emailImage!)

        let passwordImage = UIImage(named:"password")
    
        addLeftImageTo(txtField: txtPassword, andImage: passwordImage!)
       
      
    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 30, height: 30))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        
        let preferences = UserDefaults.standard
        let currentLevelKey = "userLevel"
        preferences.set(1, forKey: currentLevelKey)
        preferences.synchronize()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "gohome") as UIViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.dismiss(animated: true, completion: nil)
        appDelegate.window?.rootViewController = view
    }
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
