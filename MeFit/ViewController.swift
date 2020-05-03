//
//  ViewController.swift
//  MeFit
//
//  Created by Sumant Sogikar on 02/05/20.
//  Copyright © 2020 CanTin Squad. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController {
    let gradientLayer = CAGradientLayer()
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set(false, forKey: "Value")
        var name = ""
         print("Name set as:",name)
        if UserDefaults.standard.string(forKey: "name") != nil{
        name = UserDefaults.standard.string(forKey: "name")!
            print("Name:",name)
        }
        if UserDefaults.standard.bool(forKey: "Value") == true{
        if UserDefaults.standard.integer(forKey: "count") == 0{
            print("Counted")
            UserDefaults.standard.setValue(420, forKey: "count")
            print("Defaults set")
            let ref = Database.database().reference().child("User").child(name)
            ref.child(String(420)).setValue("Why So Empty?")
            print("Done")
        }
        }
        b1.layer.masksToBounds = true
        b2.layer.masksToBounds = true
        b1.layer.cornerRadius = 50
        b2.layer.cornerRadius = 40
        b1.layer.borderColor = .init(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        
        switch traitCollection.userInterfaceStyle {
        case .light, .unspecified: gradientColor = [UIColor(red: 142/255, green: 158/255, blue: 171/255, alpha: 1).cgColor, UIColor(red: 190/255, green: 200/255, blue: 207/255, alpha: 1).cgColor,UIColor(red: 238/255, green: 242/255, blue: 243/255, alpha: 1).cgColor]
            break
                // light mode detected
        case .dark: gradientColor = [UIColor(red: 56/255, green: 1/255, blue: 54/255, alpha: 1).cgColor, UIColor(red: 34/255, green: 93/255, blue: 120/255, alpha: 1).cgColor,UIColor(red: 12/255, green: 186/255, blue: 186/255, alpha: 1).cgColor]
            break
                // dark mode detected
        @unknown default:
            fatalError()
        }
        // Do any additional setup after loading the view.
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = gradientColor
        gradientColor = gradientLayer.colors!
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        //nothing goes here
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDefaults.standard.bool(forKey: "Value") == false {
//            print("Hello.")
            UserDefaults.standard.set(true, forKey: "Value")
            self.performSegue(withIdentifier: "ToLogin", sender: self)
        }
    }

}

