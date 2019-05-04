//
//  AddTaskVC.swift
//  ToDoApp
//
//  Created by Rajat on 04/05/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    // MARK: - Properties
    var toDoTask = ToDoModal() // Stores property value for user inputs.
    
     // MARK: - IBOutlets
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var taskTitleTxtField: UITextField!
    @IBOutlet weak var taskDescTxtView: UITextView!
    
    @IBOutlet weak var topContraintOutlet: NSLayoutConstraint!
    @IBOutlet weak var saveTaskBtnOutlet: UIButton!
    
    @IBAction func saveTaskBtnAction(_ sender: Any) {
        Singleton.shared.taskListArr.append(toDoTask)
        
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskTitleTxtField.delegate = self
        taskDescTxtView.delegate = self
        
        // changing border corner radious
         self.view.makeBorderAndCornerRadious(borderWidth: 0.3, to: taskView, with: UIColor.gray, cornerRadious: 3)
        self.view.makeBorderAndCornerRadious(borderWidth: 0.3, to: saveTaskBtnOutlet, with: UIColor.gray, cornerRadious: saveTaskBtnOutlet.frame.height / 2 )
        
        //Looks for single taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.taskDescTxtView.text = "Write your description here"
        taskDescTxtView.textColor = UIColor.lightGray
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    // MARK: - Custom methods
    @objc func keyboardWillShow(notification : Notification) {
        UIView.animate(withDuration: 0.3) {
            self.topContraintOutlet.constant = -(self.taskDescTxtView.frame.height/2)
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillHide(notification : Notification) {
        UIView.animate(withDuration: 0.3) {
            self.topContraintOutlet.constant = 8
            self.view.layoutIfNeeded()
        }
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    
    // MARK: - TextField Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == taskTitleTxtField {

            if (textField.text?.isEmpty)! {
                textField.text = "Write your title here"
                textField.textColor = UIColor.lightGray
            }
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.text == "Write your title here" {
            textField.text = nil
            textField.textColor = UIColor.black
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskDescTxtView.becomeFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        toDoTask.taskTitle = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        return true
    }
    
    // MARK: - TextView delegate
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == taskDescTxtView {
        
            if textView.text.isEmpty {
                textView.text = "Write your description here"
                textView.textColor = UIColor.lightGray
            }
        }
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView == taskDescTxtView {
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(keyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
            
            textView.text = nil
            textView.textColor = UIColor.lightGray
        }
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if textView == self.taskDescTxtView {
            toDoTask.taskDetail  = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        }
        return true
    }
}
