//
//  First_SurveyViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/20/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit

class First_SurveyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    var stringValue: String = "5"

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet var sliderValue: UISlider!
   
    @IBOutlet var valueLabel: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        //valueLabel.text = sliderValue.value
        
        let temp = sliderValue.value * 10
        
        let intValue: Int = Int(temp)
        
        stringValue = String(intValue)
        
        valueLabel.text = String(intValue)
        
    }
    
    
    @IBAction func continuePressed(_ sender: Any) {
        
        //answers.append(stringValue)
        
        self.performSegue(withIdentifier: "goToSecondQuestion", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "goToSecondQuestion") {
            
            if let destination = segue.destination as? Second_SurveyViewController {
                
                destination.firstAnswer = stringValue
            }
            
        }
    }

    

}
