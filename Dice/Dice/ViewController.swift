//
//  ViewController.swift
//  Dice
//
//  Created by Grace Liu on 08/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    /// Put diceNames into an array
    let diceArray = ["dice-1", "dice-2", "dice-3", "dice-4", "dice-5", "dice-6"]

    
    /// var means the value can be changed
    /// - indexL: index for left dice image set in diceArray
    var indexL = 0
    var indexR = 0
    
    
    /// Claim the objects in storyboard as Outlet
    @IBOutlet weak var diceL: UIImageView!
    @IBOutlet weak var diceR: UIImageView!
    
    
    
    /// Claim the button in storyboard as Action
    /// - Parameter sender: the type of sender, here is UIButton
    @IBAction func rollBtn(_ sender: UIButton) {
        
        updateDice()
    }
    
    
    /// It can be googled in apple document for actions by shaking iPhone
    /// - Parameters:
    ///   - motion: a basic motion which is shake here
    ///   - event: what it will do
    override func motionEnded(_ motion: UIEvent.EventSubtype,
                     with event: UIEvent?) {
        
        updateDice()
    }
    

    /// It is the priority funciton when application begins
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateDice()
    }
    
    
    /// The entire steps to update dice images
    func updateDice() {
        indexL = Int.random(in: 0...5)
        indexR = Int.random(in: 0...5)
        diceL.image = UIImage(named: diceArray[indexL])
        diceR.image = UIImage(named: diceArray[indexR])
    }


}

