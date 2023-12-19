//
//  ViewController.swift
//  Guess The Flag - Project 2
//
//  Created by Burak Güzey on 19.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctanswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 4
        button2.layer.borderWidth = 4
        button3.layer.borderWidth = 4
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestions(action: nil)
        
    }
    
    func askQuestions(action: UIAlertAction!) {
        countries.shuffle()
        correctanswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
     
        title = countries[correctanswer].uppercased()
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctanswer {
            title = "Correct"
            score += 1
        } else {
            title = "False"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
        present(ac, animated: true)
        
    }
    
   
    
}

 
