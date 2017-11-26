//
//  ViewSurveyRecordViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/26/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit

class ViewSurveyRecordViewController: UIViewController {
    
    var firstAnswer: String?
    var secondAnswer: String?
    var thirdAnswer: String?
    var surveyDateTime: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        surveyDate.text = surveyDateTime
        firstQuestion.text = "Hip fracture importance: " + firstAnswer!
        secondQuestion.text = "Spinal fracture importance: " + secondAnswer!
        thirdQuestion.text = "Activity importance: " + thirdAnswer!
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var surveyDate: UILabel!

    @IBOutlet var firstQuestion: UILabel!
    
    
    @IBOutlet var secondQuestion: UILabel!
    
    
    @IBOutlet var thirdQuestion: UILabel!

}
