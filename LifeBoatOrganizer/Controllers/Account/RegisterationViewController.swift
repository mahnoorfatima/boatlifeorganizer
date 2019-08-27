//
//  RegisterationViewController.swift
//  LifeBoatOrganizer
//
//  Created by Mahnoor Fatima on 26/06/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking

class RegisterationViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
        self.hideKeyboardWhenTappedAround()
        let emailImage = UIImage(named:"email")
        
        addLeftImageTo(txtField: email, andImage: emailImage!)
        addLeftImageTo(txtField : password, andImage: UIImage(named:"password")!)
        addLeftImageTo(txtField : confirmpassword, andImage: UIImage(named:"password")!)

         addLeftImageTo(txtField : phone, andImage: UIImage(named:"call")!)
         addLeftImageTo(txtField : name, andImage: UIImage(named:"profile")!)

        
    }
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 30, height: 30))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    @IBAction func registerUser(_ sender: Any) {
       // addRequest2()
        if(email.text != "" && name.text != "" && password.text != "")
        {addRequest2()}
        else {

              let alertController = UIAlertController(title: "Oops", message: "Please fill the required fields" , preferredStyle: .alert)
              let defaultAction2 = UIAlertAction(title: "Hmmm Okay", style: .default, handler: nil)
           alertController.addAction(defaultAction2)
            present(alertController, animated: true, completion: nil)
        }
    }
    func addRequest2() {
       
        
        SVProgressHUD.show(withStatus: "Requesting...")
        SVProgressHUD.setDefaultMaskType(.black)
        let parameter =  [
            "Name":  name.text,
            "Email":  email.text,
            "Password":  password.text,
            "ConfirmPassword":  confirmpassword.text,
            "Phone":  phone.text,
            "Address": "",
            "Country": "",
            "City": "",
            "Longitude": 00.00,
            "Latitude": 00.00
            ] as [String : Any]
        
        let manager = AFHTTPSessionManager()
        manager.responseSerializer = AFJSONResponseSerializer(readingOptions: JSONSerialization.ReadingOptions.allowFragments)
        manager.post("http://3.104.109.201/boatapi/Account/Register", parameters: parameter, success: {(operation, responseObject) in
            if let dic = responseObject as? String {
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
                
                if(dic != ""){
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "cdee") as? CodeViewController
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            }
            else{
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "main") as? MainViewController
            
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            }

        }, failure: {
            (operation, error) in
            print("Error: " + error.localizedDescription)
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
                let alert = UIAlertController(title: "Oops!", message: "There is something wrong, please try again.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
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
