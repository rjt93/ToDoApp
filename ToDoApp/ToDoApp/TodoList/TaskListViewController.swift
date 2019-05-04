//
//  ViewController.swift
//  ToDoApp
//
//  Created by Rajat on 04/05/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - IBAction
    @IBAction func editBtnAction(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    @IBAction func addTaskBtnAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddTaskVC") as! AddTaskVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        self.tableView.isEditing = false
    }
    
    // MARK :- Tableview Delegate & Datasource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.taskListArr.count > 0 ? Singleton.shared.taskListArr.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell") as! TodoListTableViewCell
        
        let task = Singleton.shared.taskListArr[indexPath.row]
        cell.titleLbl.text = task.taskTitle
        cell.descriptionLbl.text = task.taskDetail
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           // print("Deleted")
        
            Singleton.shared.taskListArr.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = Singleton.shared.taskListArr[sourceIndexPath.row]
        Singleton.shared.taskListArr.remove(at: sourceIndexPath.row)
        Singleton.shared.taskListArr.insert(movedObject, at: destinationIndexPath.row)
    }
}

