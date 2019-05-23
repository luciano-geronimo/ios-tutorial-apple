//
//  ViewController.swift
//  TutorialAppleFoodTracker
//
//  Created by LUCIANO G LISBOA on 23/05/19.
//  Copyright © 2019 LUCIANO G LISBOA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealName.text = "Default text"
    }
    


}

