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
    
    
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
        
        
    }
    @IBAction func themeToggled(_ sender: UISwitch) {
        setTheme(isDark: sender.isOn)
    }
    
    var isDefaultStatusBar = true
    
    // 2
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDefaultStatusBar ? .default : .lightContent
    }

    
    func setupViews() {
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 0.05
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        
        outputCardView.layer.cornerRadius = 8
        outputCardView.layer.masksToBounds = true
        
        inputCardView.layer.cornerRadius = 8
        inputCardView.layer.masksToBounds = true
        
        // set output card border
        outputCardView.layer.borderWidth = 1
        outputCardView.layer.borderColor = UIColor.tcHotPink.cgColor
        
        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
    }
    
    func setTheme(isDark: Bool) {
        let theme = isDark ? ColorTheme.dark : ColorTheme.light
        
        view.backgroundColor = theme.viewControllerBackgroundColor
        
        headerView.backgroundColor = theme.primaryColor
        titleLabel.textColor = theme.primaryTextColor
        
        inputCardView.backgroundColor = theme.secondaryColor
        
        billAmountTextField.tintColor = theme.accentColor
        tipPercentSegmentedControl.tintColor = theme.accentColor
        
        outputCardView.backgroundColor = theme.primaryColor
        outputCardView.layer.borderColor = theme.accentColor.cgColor
        
        tipAmountTitleLabel.textColor = theme.primaryTextColor
        totalTitleLabel.textColor = theme.primaryTextColor
        
        tipAmountLabel.textColor = theme.outputTextColor
        totalLabel.textColor = theme.outputTextColor
        
        resetButton.backgroundColor = theme.secondaryColor
        
        isDefaultStatusBar = theme.isDefaultStatusBar
        setNeedsStatusBarAppearanceUpdate()

    }
    
    func clear() {
        billAmountTextField.text = nil
        tipPercentSegmentedControl.selectedSegmentIndex = 0
        tipAmountLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    func calculate() {
        // dismiss keyboard
        if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
        }
        
        guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                clear()
                return
        }
        
        let roundedBillAmount = (100 * billAmount).rounded() / 100
        
        let tipPercent: Double
        switch tipPercentSegmentedControl.selectedSegmentIndex {
        case 0:
            tipPercent = 0.15
        case 1:
            tipPercent = 0.18
        case 2:
            tipPercent = 0.20
        default:
            preconditionFailure("Unexpected index.")
        }
        
        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = (100 * tipAmount).rounded() / 100
        
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        // Update UI
        self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
        self.totalLabel.text = String(format: "%.2f", totalAmount)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("reset button tapped")
        clear()
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme(isDark: false)
        setupViews()
        
        billAmountTextField.calculateButtonAction = {
            self.calculate()
        }
    }
    
}

