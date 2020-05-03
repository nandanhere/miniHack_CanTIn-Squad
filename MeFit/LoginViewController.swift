//
//  LoginViewController.swift
//  MeFit
//
//  Created by Sumant Sogikar on 03/05/20.
//  Copyright © 2020 CanTin Squad. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class LoginViewController: UIViewController {
  
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txt: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    @IBAction func Logged(_ sender: Any) {
        if txt.text!.count > 2{
            var name = ""
            if UserDefaults.standard.string(forKey: "name") == nil{
                UserDefaults.standard.setValue(txt.text!, forKey: "name")
                name = UserDefaults.standard.string(forKey: "name")!
            }
            else{
                UserDefaults.standard.setValue(txt.text!, forKey: "name")
                name = UserDefaults.standard.string(forKey: "name")!
            }
            print("ULALAL",name)
            let ref = Database.database().reference().child("User").child(name)
            ref.child(String(1)).setValue("WELCOME!")
            ref.child(String(2)).setValue("We hope that, you will")
            ref.child(String(3)).setValue("be a happier person with our help.")
            ref.child(String(4)).setValue("Swipe left to delete an entry")
            if UserDefaults.standard.integer(forKey: "count") == 0{
                UserDefaults.standard.setValue(3, forKey: "count")
            }
            print("OPOPOPOPOPOP")
            self.performSegue(withIdentifier: "GoB", sender: self)
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
