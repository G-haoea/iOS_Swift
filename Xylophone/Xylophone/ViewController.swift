//
//  ViewController.swift
//  Xylophone
//
//  Created by Grace Liu on 09/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    /// - Parameter player: Claim an object with AVAudioPlayer
    var player : AVAudioPlayer!
    
    
    /// What the programme will do when click the different buttons
    /// - Parameter sender: the different buttons with different tags
    @IBAction func click(_ sender: UIButton) {
        playMusic(tag: sender.tag)
    }
    
    
    /// The main function to acheive playing music
    /// - Parameter tag: it designs different buttons
    /// - Parameter url: the variable which contains the name of sounds file
    func playMusic(tag: Int){
        
        let url = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav")
        
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        }catch{
            print(error)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

