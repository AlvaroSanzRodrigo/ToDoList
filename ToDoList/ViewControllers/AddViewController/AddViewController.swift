//
//  AddViewController.swift
//  ToDoList
//
//  Created by Álvaro Sanz Rodrigo on 19/12/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: class {
    func addViewController(_ vc: AddViewController, didEditTask task: Task)
}

class AddViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var saveButton: UIButton!
    internal var task: Task!
    weak var delegate: AddViewControllerDelegate!
    
    convenience init(task: Task?) {
        self.init()
        if task == nil {
            self.task = Task()
            self.task.id = UUID().uuidString
            self.task.name = ""
            self.task.completed = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.8) {
            self.view.backgroundColor =
            UIColor.white.withAlphaComponent(0.8)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBack.layer.cornerRadius = 8.0
        viewBack.layer.masksToBounds = true
        
        saveButton.layer.cornerRadius = 8.0
        viewBack.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveAction(_ sender: Any) {
        task.name = nameTextField.text
        delegate.addViewController(self, didEditTask: task)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func closeAction(_ sender: Any) {
        UIView.animate(withDuration: 0.8) {
            self.view.backgroundColor =
                UIColor.clear
        }
        dismiss(animated: true, completion: nil)
    }
}
