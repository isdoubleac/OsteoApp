//
//  First_SurveyViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/20/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit

class First_SurveyViewController: UIViewController {

    var questions = Array<String>(repeating:" ", count:11)
    
    var answers = Array<Int>(repeating:0, count:9)
    
    @IBOutlet weak var progressBar: UIProgressView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions[1] = "How important is protection from hip fractures to you when making a decision about osteoporosis therapies?"
        questions[2] = "How important is protection from spinal fractures to you when making a decision about osteoporosis therapies?"
        questions[3] = "How important is the ability to stay active to you when making a decision about osteoporosis therapies?"
        questions[4] = "What other positive factors are inportant to you when making a decision about osteoporosis therapies?"
        questions[5] = "How important is the risk of breast cancer to you when making a decision about osteoporosis therapies?"
        questions[6] = "How important is the risk of blood clots to you when making a decision about osteoporosis therapies?"
        questions[7] = "How important is the risk of gastro-intestinal side effects (such as ulcer) to you when making a decision about osteoporosis therapies?"
        questions[8] = "What other negative factors are important to you when making a decision about osteoporosis therapies? (Please specify and negative factors you have considered and rate their importance to you)"
        
        questionLabel.text = questions[1]
        progressLabel.text = "1/8"
        progressBar.progress = 1.0/8.0
    }
    var stringValue: String = "5"

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //this is the label that will contain the survey questions
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet var sliderValue: UISlider!
   
    @IBOutlet var valueLabel: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        //valueLabel.text = sliderValue.value
        
        let temp = sliderValue.value * 10
        
        let intValue: Int = Int(temp)
        
        stringValue = String(intValue)
        
        valueLabel.text = String(intValue)
        
    }
    
    
    func updateQuestion(q_num:Int) {
        //run 2 arrays indexed from 1
        //one that holds all strings to pull from
        //one that I store the values in
        //also update status to be i/3
        
        //there needs to be a special case for q_num = 4
        //in that case I would have to modify the input method
        //there would be 3 text blanks, each having a slider of its own
        //Then I will have to switch back to the previous screen
        
        //****Also do the above for q_num = 8
        
        questionLabel.text = questions[q_num]
        progressLabel.text = String(q_num) + "/8"
        progressBar.progress = Float(q_num)/Float(8.0)
    }
    
    var i = 1
    @IBAction func continuePressed(_ sender: Any) {
        
        //the function handles when the first question is completed and the user clicks continue
        //modify this to just swap text rather than swapping UIs entirely
        
        //answers.append(stringValue)
        
        //shown all questions so segue
        i+=1
        if i == 9 {
            
            self.performSegue(withIdentifier: "goToResults", sender: self)
        } else {
            updateQuestion(q_num: i)
            answers[i-1] = Int(stringValue)!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "goToResults" && i == 9) {
            i = 1
            if let destination = segue.destination as? Review_ResponsesViewController {
                destination.full_questions = self.questions
                destination.answers = self.answers
            }
            
        }
    }

    

}
