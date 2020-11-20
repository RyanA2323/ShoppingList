//
//  ViewController.swift
//  ShoppingList
//
//  Created by Tiger Coder on 11/15/20.
//  Copyright © 2020 clc.Atkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var toCartOutlet: UIButton!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var tableViewOutlet: UITableView!
    var shoppingList = ["Shopping List"]
    var selectedItem = ""
    let defaults = UserDefaults.standard
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if let shop = defaults.object(forKey: "MyShoppingList") {
            shoppingList = shop as! [String]
        }
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        // Do any additional setup after loading the view.
    }
     var count = 0
    var isCheked = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell1")!
        cell.textLabel!.text = shoppingList[indexPath.row]
        cell.detailTextLabel?.text = "WHY"
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let blah = tableViewOutlet.cellForRow(at: indexPath)?.isSelected{
            if isCheked == false {
            tableViewOutlet.cellForRow(at: indexPath)?.backgroundColor = UIColor.green
                isCheked = true
                
            }
            else if isCheked == true {
                tableViewOutlet.cellForRow(at: indexPath)?.backgroundColor = UIColor.white
                isCheked = false
            }
        }
        tableViewOutlet.reloadData()
    }

    @IBAction func addAction(_ sender: UIButton) {
        count = 0
        var stop = false
        while count < shoppingList.count  {
            
            if textFieldOutlet.text == shoppingList[count] {
                let alert = UIAlertController(title: "ERROR!", message: "You already entered that item", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                stop = true
                count = shoppingList.count
            }
            else {
                count+=1
                
            }
                
            
        }
        if stop == false {
        shoppingList.append(textFieldOutlet.text!)
        tableViewOutlet.reloadData()
        textFieldOutlet.text = ""
        }
    }
   
    @IBAction func toCartButton(_ sender: Any) {
        
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        defaults.set(shoppingList, forKey: "MyShoppingList")
    }
    
      
    }
    
        
    


