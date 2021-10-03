//
//  CalculatorViewController.swift
//  Tip Calculator
//
//  Created by Aryan Patel on 10/2/21.
//

import UIKit

class CalculatorViewController: UIViewController {

    //MARK: - Variables
    
    
    let tipPercentsData: [Double] = [0.10, 0.15, 0.20, 0.25]  //contains data for our tip percents
    var tipPercent: Double = 0.10                             //default tip percent
    
    //notice how the position in the percents data array correspond to the indexes in our segment
      
    
    //MARK: - IB Outlets
    
    
    @IBOutlet weak var billAmountTxtField: UITextField!         //this is where we enter the amount
    @IBOutlet weak var tipSegmentControl: UISegmentedControl!   //segment control to switch tip %
    
    @IBOutlet weak var tipTotalLbl: UILabel!        //this label displays the tip total
    @IBOutlet weak var amountTotalLbl: UILabel!     //this label displays the amount total
    
    
    //MARK: - IB Actions
    
    
    @IBAction func didTapCalculate(_ sender: Any) {
        
        /* what do we want to do when the user taps "CALCULATE" ???  */
        
        /* 1. Validate the entry in the bill amount text field. */
        
        if billAmountTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            print("invalid entry for bill amount text field")
            return
        }
        
        let billString = billAmountTxtField.text!
        
        /* 2. Calculate the amount total and tip total using the data we receive from the segment control */
        
        //tip total:
        guard let billAmount = Double(billString) else { return }
        let tipAmount = billAmount * tipPercent
                
        //amount total:
        let amountTotal = billAmount + tipAmount
        
        /* 3. Display our totals in their corresponding labels */
        
        tipTotalLbl.text = String(format: "$%.2f", tipAmount)
        amountTotalLbl.text = String(format: "$%.2f", amountTotal)
        
        //note the unique string format
        
        /* dismissing the keyboard for our own sanity */
        view.endEditing(true)
        
        
    }
    
    @IBAction func didTapReset(_ sender: Any) {
        
        /* what do we want to do when the user taps "RESET" ??? */
        
        /* 1. Reset all fields to empty and change the segment and labels to default value/text */

        tipPercent = 0.10                            //default tip percent
        tipSegmentControl.selectedSegmentIndex = 0   //move the selected segment index back to 10%
        
        billAmountTxtField.text = ""        //initialize to default value
        
        tipTotalLbl.text = "$0.00"          //initialize to default value
        amountTotalLbl.text = "$0.00"       //initialize to default value
        
    }
    
    
    @IBAction func didTapTipSegmentControl(_ sender: UISegmentedControl) {
        
        
        /* what do we want to do when the user taps the segment control ??? */
        
        /* 1. Using the selected index we recieve from the segment control we will get the data from our array using the index and get the corresponding value */
        
        /*
            -- Note that our array looks like this: [0.10, 0.15, 0.20, 0.25]
            -- And our segment control looks like:  [10% | 15% | 20% | 25%]
         
            -- if the user taps the 15% percent for example, our selected segment index
                will be equal to 1.
         
            -- now that we have the selected segment index, we can use it to retrieve our data from the array at the index 1.
         
            -- we can now set this data value equal to our tip percent variable which defaulted to 0.10
         
            -- this sounds like alot but we can do it in one line! This is the magic of the UI segment control and arrays.
 
        */
        
        tipPercent = tipPercentsData[sender.selectedSegmentIndex]
        
        
    }
        
    
    // MARK: - View LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipTotalLbl.text = "$0.00"          //initialize to default value
        amountTotalLbl.text = "$0.00"       //initialize to default value

        
    }
    

}
