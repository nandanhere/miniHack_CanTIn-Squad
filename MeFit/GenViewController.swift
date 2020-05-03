//
//  GenViewController.swift
//  MeFit
//
//  Created by Sumant Sogikar on 03/05/20.
//  Copyright © 2020 CanTin Squad. All rights reserved.
//

import UIKit
import FirebaseDatabase
    var dict : [UIImage : (String,String)] = [:]
class GenViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var Lab: UILabel!
    var tesk = ""
    let name = UserDefaults.standard.string(forKey: "name") ?? "name"
    override func viewDidLoad() {
        super.viewDidLoad()
        dict[#imageLiteral(resourceName: "Pet")] = ("Adopt a Pet","Did you know that having a pet would make you happier exponentially and would also keep you fit and accompanied.Try adopting a pet at a shelter near your home.")
        dict[#imageLiteral(resourceName: "Advent")] = ("Go on trip","A good holiday can calm anybody down.Take some days off and head for a great destination where you can enjoy the nature at its finest")
        dict[#imageLiteral(resourceName: "Video")] = ("Video Call your Friends","When you are home alone, try catching up with your friends and cherish the past that you had spent with them")
        dict[#imageLiteral(resourceName: "Kaafi")] = ("Buy Some Groceries","Grocery Shopping isn't boring when you buy stuffs you like.Head out to a nearby store and buy some healthy snacks and drinks.")
        dict[#imageLiteral(resourceName: "Photo")] = ("Appreciate Nature","Take some time off and start appreciating the beautiful sceneries around you.")
        dict[#imageLiteral(resourceName: "Cook")] = ("Get Cooking","Try to cook something delicious, many people end up loving to cook even though at first they aren't ready to get off the couch")
        dict[#imageLiteral(resourceName: "Cake")] = ("Get Baking","Open the oven and start baking some goodies to pleasure your taste buds and boost happiness with the sucrose present in it.")
        dict[#imageLiteral(resourceName: "Sport")] = ("Play Something","Head out for a game of ball or skate around your block. Just remember to feel the air when you do it.")
        dict[#imageLiteral(resourceName: "Door")] = ("Leave the City for a while","Head out into the waving greenery and the blissful sound of the ocean. A place where there is peace and no work pressure.")
        let index = Int(arc4random_uniform(UInt32(dict.count)))
        let key = Array(dict.keys)[index]
        let (task,descp) = Array(dict.values)[index]
        myImageView.image = key
        tesk = task
        Lab.text! = descp
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Adder(_ sender: Any) {
        let ref = Database.database().reference().child("User").child(name)
        let count = UserDefaults.standard.integer(forKey: "count")
        ref.child(String(count+1)).setValue(tesk)
        UserDefaults.standard.set(count+1, forKey: "count")
    }
    
    @IBAction func next(_ sender: Any) {
        let index = Int(arc4random_uniform(UInt32(dict.count)))
               let key = Array(dict.keys)[index]
               let (task,descp) = Array(dict.values)[index]
               myImageView.image = key
               tesk = task
               Lab.text! = descp
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
