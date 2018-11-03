//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var inputCardView: UIView!
    
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var outputCardView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("reset button tapped")

    }
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
        
        
    }
    @IBAction func themeToggled(_ sender: UISwitch) {
        
        
        
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.calculateButtonAction = {
            // 1
            guard let billAmountText = self.billAmountTextField.text,
                let billAmount = Double(billAmountText) else {
                    return
            }
            
            let roundedBillAmount = (100 * billAmount).rounded() / 100
            
            // 2
            let tipPercent = 0.15
            let tipAmount = roundedBillAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            // 3
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            print("Bill Amount: \(roundedBillAmount)")
            print("Tip Amount: \(roundedTipAmount)")
            print("Total Amount: \(totalAmount)")
        }
    }
    
}

