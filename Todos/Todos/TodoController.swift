//
//  TodoController.swift
//  Todos
//
//  Created by Grace Liu on 19/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit

/// The protocol claim for todoDelegate
/// Two methods in this delegate: add and edit
protocol TodoDelegate {
    func didAdd(addTaskText: String)
    func didEdit(editTaskText: String)
}

class TodoController: UITableViewController {

    var editTodoInput : String?
    var delegate : TodoDelegate?
    
    @IBOutlet weak var todoInput: UITextField!
    
    
    /// When click confirm button after editing text in add page, the data will be delivered back to 1st page
    /// - Parameter sender: the confirm button in 2nd page
    @IBAction func confirmText(_ sender: UIBarButtonItem) {
        
        // inputText is the text which user input in the textField
        if let inputText = todoInput.text, !inputText.isEmpty{
            // if editTodoInput from 1st is not nil, that means the current state is editing, run didEdit()
            // else the current state is adding, run didAdd()
            if editTodoInput != nil {
                delegate?.didEdit(editTaskText: inputText)
            }else{
                delegate?.didAdd(addTaskText: inputText)
            }
        }
        
        // let 2nd page out of the main Navigation box like pop
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        todoInput.becomeFirstResponder()
        
        todoInput.text = editTodoInput
        if editTodoInput != nil{
            self.navigationItem.title = "Edit Todo"
        }
    }

    // MARK: - Table view data source

   

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
