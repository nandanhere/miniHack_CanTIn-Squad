//
//  ToDoViewController.swift
//  MeFit
//
//  Created by Sumant Sogikar on 02/05/20.
//  Copyright © 2020 CanTin Squad. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ToDoViewController: UIViewController, UITableViewDataSource , UITableViewDelegate, UISearchBarDelegate {
    let name = UserDefaults.standard.string(forKey: "name") ?? "name"
    var arr : [String:String] = [:]
    var earr : [String:String] = [:]
    var keys : [Int] = []
    var ekeys : [Int] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print(name,"OPOPOPOPOPOP")
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        var ref : DatabaseReference?
        var dbh : DatabaseHandle?
        if arr.count > 0 {
            return
        }
        
        ref = Database.database().reference().child("User").child(name)
        dbh = ref?.observe(.childAdded, with: { (snapshot) in
        let post = snapshot.value as? String
            let key = snapshot.key
        if let apost = post{
        self.arr[key] = apost
            self.earr = self.arr
            self.keys.append(Int(key)!)
            self.ekeys = self.keys
            print("GG",self.arr)
        self.tableView.reloadData()
        }
        })
        ekeys.sort()
        print("Popped!")
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.earr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.ekeys.sort()
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.lbl1.text = earr[String(ekeys[indexPath.row])]
            
         return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView,
    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let cell = tableView.cellForRow(at: indexPath)
        let deleteAction = UIContextualAction(style: .destructive, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
            let val = self.ekeys.remove(at: indexPath.row)
            let k = self.keys.firstIndex(of: val)
            self.keys.remove(at: k!)
            self.earr.removeValue(forKey: String(val))
            self.arr.removeValue(forKey: String(val))
            let ref = Database.database().reference().child("User").child(self.name)
            ref.child(String(val)).removeValue()
             tableView.deleteRows(at: [indexPath], with: .fade)
             self.tableView.reloadData()
             })
        deleteAction.backgroundColor = .red

        return UISwipeActionsConfiguration(actions: [deleteAction])
            
    }
    @IBOutlet weak var searchBar: UISearchBar!
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else
        {
            earr = arr
            ekeys = keys
            tableView.reloadData()
            return
        }
        var kk : [Int] = []
        print("QQQQQ",arr)
        earr = arr.filter({ ele -> Bool in
            guard let text = searchBar.text  else { return false}
            var val = false
            if ele.value.contains(text){
            kk.append(Int(ele.key)!)
                val = true
            }
            ekeys = kk
            print("QQQQQ",kk)
            tableView.reloadData()
            return val
        })
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        earr = arr
        ekeys = keys
        searchBar.resignFirstResponder()
        tableView.reloadData()
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
