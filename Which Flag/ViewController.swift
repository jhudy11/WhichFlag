//
//  ViewController.swift
//  Which Flag
//
//  Created by Joshua Hudson on 4/29/17.
//  Copyright © 2017 ParanoidPenguinProductions. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnTopOUTLET: UIButton!
    @IBOutlet weak var btnMiddleOUTLET: UIButton!
    @IBOutlet weak var btnBottomOUTLET: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        setupButtons()
        askQuestion()
        
    }
    
    func setupButtons() {
        
        btnTopOUTLET.layer.borderWidth = 1
        btnMiddleOUTLET.layer.borderWidth = 1
        btnBottomOUTLET.layer.borderWidth = 1
        
        btnTopOUTLET.layer.borderColor = UIColor.black.cgColor
        btnMiddleOUTLET.layer.borderColor = UIColor.black.cgColor
        btnBottomOUTLET.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        // Create a random set of flags using GameplayKit
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        btnTopOUTLET.setImage(UIImage(named: countries[0]), for: .normal)
        btnMiddleOUTLET.setImage(UIImage(named: countries[1]), for: .normal)
        btnBottomOUTLET.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Set the correct answer
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        
        title = countries[correctAnswer].uppercased()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            
            title = "Correct"
            score += 1
            
        } else  {
            
            title = "Incorrect"
            score -= 1
            
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}













