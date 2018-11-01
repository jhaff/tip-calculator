//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var inputCardView: UIView!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    // MARK: - View Lifecycle
    
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
    }
    @IBAction func themeToggled(_ sender: UISwitch) {
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

