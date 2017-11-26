//
//  Review_ResponsesViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/20/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class Review_ResponsesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var firstAnswer: String?
    var secondAnswer: String?
    var thirdAnswer: String?
    
    var questionSelected: String?
    
    var questions : [String] = ["1. Hip Fracture importance: ", "2. Spinal Fracture importance: ", "3. Activity importance: "]
    
    var answers : [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        answers.append(firstAnswer!)
        answers.append(secondAnswer!)
        answers.append(thirdAnswer!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var responseTable: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.responseTable.dequeueReusableCell(withIdentifier: "responseCell", for: indexPath)
        
        
        cell.textLabel!.text = questions[indexPath.row] + answers[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        questionSelected = String(indexPath.row + 1)
        self.performSegue(withIdentifier: "goUpdateResponse", sender: self) 
                
    }

    @IBAction func submitPressed(_ sender: Any) {
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        
        let dateTime = formatter.string(from: currentDateTime)
        
        print(dateTime)
        
        // this is where we want to save to Core Data
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Survey_Record", in: managedContext!)!
        
        let record = NSManagedObject(entity: entity, insertInto: managedContext)
        
        record.setValue(firstAnswer, forKeyPath: "firstQuestion")
        record.setValue(secondAnswer, forKeyPath: "secondQuestion")
        record.setValue(thirdAnswer, forKeyPath: "thirdQuestion")
        record.setValue(dateTime, forKeyPath: "dateTime")
        
        do {
            try managedContext?.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        self.performSegue(withIdentifier: "submitPressed", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "goUpdateResponse") {
            
            if let destination = segue.destination as? Update_ResponsesViewController {
                
                destination.questionNumber = questionSelected
                destination.firstAnswer = firstAnswer
                destination.secondAnswer = secondAnswer
                destination.thirdAnswer = thirdAnswer
            }
            
        }
    }


    
}
