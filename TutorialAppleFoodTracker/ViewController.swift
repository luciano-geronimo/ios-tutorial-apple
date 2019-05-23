//
//  ViewController.swift
//  TutorialAppleFoodTracker
//
//  Created by LUCIANO G LISBOA on 23/05/19.
//  Copyright © 2019 LUCIANO G LISBOA. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITextFieldDelegate{
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    //MARK: UIViewController delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealName.text = textField.text
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealName.text = "Default text"
    }
    


}

