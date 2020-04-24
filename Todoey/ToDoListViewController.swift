//
//  ToDoListViewController.swift
//  Todoey
//
//  Created by Paulina on 23/4/20.
//  Copyright © 2020 Paulina. All rights reserved.
//

import UIKit

class ToDoListViewController : UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogron"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if let item = defaults.array(forKey: "ToDoListArray") as! [String]? {
            itemArray = item
        }
    }
    
    
    // MARK - Tableview Data Source
  
    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
       
       // Configure the cell’s contents.
        cell.textLabel!.text = itemArray[indexPath.row]
           
       return cell
    }
// MARK Table View Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add new ToDoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item" , style: .default) { (action) in
            // what will happen when the user clic on the add item button i UIAlert
          
          
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray
                  , forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

    
}


