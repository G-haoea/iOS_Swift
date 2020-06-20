//
//  TodosController.swift
//  Todos
//
//  Created by Grace Liu on 19/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit

class TodosController: UITableViewController {

 
//    var todos = [
//        Todo(text: "Drink water", check: false),
//        Todo(text: "Walk", check: false),
//        Todo(text: "Sleep on time", check: false)
//    ]
    
    /// - parameter row: the row of the editing cell, text from 2nd will be delivered into row in 1st page
    var todos : [Todo] = []
    var row = 0
    
    // The delete button which will appear when multiple edit
    @IBOutlet weak var multiDeleteBtn: UIBarButtonItem!
    
    // What will happen when click multiple delete
    @IBAction func multiDelete(_ sender: UIBarButtonItem) {
        if let indexPaths = tableView.indexPathsForSelectedRows{
            for indexPath in indexPaths{
                todos.remove(at: indexPath.row)
            }
            
            // save difference on todos into Encode-Decode
            saveData()
            
            tableView.beginUpdates()
            tableView.deleteRows(at: indexPaths, with: .automatic)
            tableView.endUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        // Create an edit button on leftBarButtonItem because it cannot be created on storyboard
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        multiDeleteBtn.title = ""
        
        // The process of decoding
        if let data = UserDefaults.standard.data(forKey: "todos"){
            do{
                todos = try JSONDecoder().decode([Todo].self, from: data)
                
            }catch{
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    // The cell will show todos's content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Find the target cell by identifier which was given in storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "todos", for: indexPath) as! TodosCell

        // Configure the cell...
        cell.todoTextLabel.text = todos[indexPath.row].text
        cell.todoCheckLabel.text = todos[indexPath.row].check ? "✅" : "〇 "
       
        

        return cell
    }
    
    // When select the cell, the checkLable will change
    // But when isEditing, it will not run
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !isEditing{
            
            todos[indexPath.row].check = !todos[indexPath.row].check
            saveData()
            let cell = tableView.cellForRow(at: indexPath) as! TodosCell
            cell.todoCheckLabel.text = todos[indexPath.row].check ? "✅" : "〇 "
            
            // Cancel the display that when click, the background is always grey
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    
    // When editing the cell, the text of editButton and multiDeleteBtn will change
    override func setEditing(_ editing: Bool, animated: Bool) {
        // Remember to inherit super's setEditing
        super.setEditing(editing, animated: animated)
        editButtonItem.title = isEditing ? "Done" : "Edit"
        multiDeleteBtn.title = isEditing ? "Delete" : ""
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            //Remove the selected data which want to remove from todos
            todos.remove(at: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Change the text of delete gestrue (from right into left with red background) into "Remove"
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addTodo"{
            let vc = segue.destination as! TodoController
            vc.delegate = self
        }else if segue.identifier == "editTodo"{
            let vc = segue.destination as! TodoController
            vc.delegate = self
            
            let cell = sender as! TodosCell
            row = tableView.indexPath(for: cell)!.row
            vc.editTodoInput = cell.todoTextLabel.text
        }
    }
    
    

}

extension TodosController : TodoDelegate{
    func didAdd(addTaskText: String) {
        todos.append(Todo(text: addTaskText, check: false))
        saveData()
        let indexPath = IndexPath(row: todos.count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    func didEdit(editTaskText: String) {
       
        todos[row].text = editTaskText
        saveData()
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! TodosCell
        cell.todoTextLabel.text = todos[row].text
    }
    func saveData(){
        do{
            let data = try JSONEncoder().encode(todos)
            UserDefaults.standard.set(data, forKey: "todos")
        }catch{
            print(error)
        }
        
    }
}
