//
//  ViewController.swift
//  Dice
//
//  Created by Grace Liu on 15/05/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceArray = ["dice-1", "dice-2", "dice-3", "dice-4", "dice-5", "dice-6"]
    
    var indexL: Int = 0
    var indexR: Int = 0
    
    @IBOutlet weak var diceImageViewL: UIImageView!
    @IBOutlet weak var diceImageViewR: UIImageView!
    
    
    @IBAction func rollButton(_ sender: Any) {

        
        updateDiceImage()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImage()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDiceImage()
    }
    
    func updateDiceImage() {
        indexL = Int.random(in: 0...5)
        indexR = Int.random(in: 0...5)
        
                
        //        diceImageViewL.image = UIImage(named: "dice-\(indexL)")
        //        diceImageViewR.image = UIImage(named: "dice-\(indexR)")
        
        diceImageViewL.image = UIImage(named: diceArray[indexL])
        diceImageViewR.image = UIImage(named: diceArray[indexR])
    }


}

