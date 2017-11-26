//
//  Second_SurveyViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/20/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit

class Second_SurveyViewController: UIViewController {
    
    var firstAnswer: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet var sliderValue: UISlider!
    
    @IBOutlet var valueLabel: UILabel!
    
    var stringValue: String = "5"
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        let temp = sliderValue.value * 10
        
        let intValue: Int = Int(temp)
        
        stringValue = String(intValue)
        
        valueLabel.text = String(intValue)
        
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "goToThirdQuestion", sender: self)   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "goToThirdQuestion") {
            
            if let destination = segue.destination as? Third_SurveyViewController {
                
                destination.firstAnswer = firstAnswer
                
                destination.secondAnswer = stringValue
            }
            
        }
    }

}
