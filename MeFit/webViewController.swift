//
//  webViewController.swift
//  MeFit
//
//  Created by Nandan on 02/05/20.
//  Copyright © 2020 CanTin Squad. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController {
    let gradientLayer = CAGradientLayer()

     @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var webButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    let webButtonShell = CAShapeLayer() // UI portion of button

    var ecount  =  0
     var randomnumber = 0
    var url :URL = URL(string: "www.Google.com")!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        websiteLabel.layer.masksToBounds = true
        descLabel.layer.masksToBounds = true
        randomButton.layer.masksToBounds = true
        websiteLabel.layer.cornerRadius = 20
        descLabel.layer.cornerRadius = 80
        randomButton.layer.cornerRadius = 10
        switch traitCollection.userInterfaceStyle {
        case .light, .unspecified:websiteLabel.backgroundColor = UIColor(hue: 1.18/360, saturation: 40/100, brightness: 1, alpha: 0.6)
        descLabel.backgroundColor = UIColor(hue: 186.69/360, saturation: 91.71/100, brightness: 93/100, alpha: 0.6)
        randomButton.backgroundColor = UIColor(hue: 12.69/360, saturation: 24.5/100, brightness: 73/100, alpha: 0.6)
                // light mode detected
        case .dark: websiteLabel.backgroundColor  = UIColor(hue: 305/360, saturation: 97/100, brightness: 1, alpha: 1)
        descLabel.backgroundColor = UIColor(hue: 186.69/360, saturation: 91.71/100, brightness: 28.39/100, alpha: 0.6)
        randomButton.backgroundColor = UIColor(hue: 12.69/360, saturation: 100/100, brightness: 39.29/100, alpha: 0.6)


            break
                // dark mode detected
        @unknown default:
            fatalError()
        }
        
 
        let linePathOfButton = UIBezierPath.init(ovalIn: CGRect.init(x: 0, y: 0, width: 70, height: 70))
        webButtonShell.frame = CGRect(x:( self.view.bounds.maxX / 2 ) - 35 , y: (self.view.bounds.maxY * 0.85) - 25, width: 50, height: 50)
        webButtonShell.lineWidth = 4
        webButtonShell.strokeColor = UIColor.init(white: 2, alpha: 0.9).cgColor
        webButtonShell.path = linePathOfButton.cgPath
         self.view.layer.insertSublayer(webButtonShell, at: 1)
 
        randomButton.frame = CGRect(x: self.view.bounds.maxX / 2 - 35 , y: (self.view.bounds.maxY * 0.85) - 120 , width: 70, height: 70)

        webButton.frame = CGRect(x: self.view.bounds.maxX / 2 - 35 , y: (self.view.bounds.maxY * 0.85) - 25 , width: 70, height: 70)
        webButton.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.8)
        webButton.layer.masksToBounds = true
        webButton.layer.cornerRadius = 35
 
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = gradientColor
        gradientLayer.zPosition = -.infinity
        self.view.layer.addSublayer(gradientLayer)
        randomnumber = random()
        websiteLabel.text = websites[randomnumber][1]
        descLabel.text = websites[randomnumber][2]
        url = URL(string: websites[randomnumber][0])!
     
 
         // Do any additional setup after loading the view.
    }
    

    
    @IBAction func webButton(_ sender: Any) {
        UIApplication.shared.open(url)
    }
    
    @IBAction func randomButton(_ sender: Any) {
        
         randomnumber = random()
        ecount += 1
        websiteLabel.text = websites[randomnumber][1]
        descLabel.text = websites[randomnumber][2]
        url = URL(string: websites[randomnumber][0])!

        easter()
        
    }
    func random () -> Int
    {
        var number = Int.random(in: 0...websites.count - 1)
        if (number == randomnumber) {number = random()}
        return number
    }
    func easter()
    {
        if (ecount %  10 == 0)
        {
            websiteLabel.text = "Are we Strangers to this ?"
            descLabel.text = "I know the rules, and maybe so do you\nA full commitment is what this app is thinking of\nYou wouldnt get this from any other app!\nTap GO and see the real trap!"
            url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ0")!
             randomButton.frame = CGRect(x: self.view.bounds.maxX / 2 - 120 , y: (self.view.bounds.maxY * 0.85) - 120 , width: 70, height: 70)
            gradientLayer.colors = [UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor, UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor,UIColor.white.cgColor]

            
        }
        else
        {
             randomButton.frame = CGRect(x: self.view.bounds.maxX / 2 - 35 , y: (self.view.bounds.maxY * 0.85) - 120 , width: 70, height: 70)
            gradientLayer.colors = gradientColor

        }
    }
     
}
