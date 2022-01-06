//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // play sound

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5 // dim color to half opacity of original color
        let seconds = 0.2
        // after 2 seconds, play sound & return to org color
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.playSound(soundName: sender.currentTitle!)
            sender.alpha = 1
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav") // gets C.wav
        player = try! AVAudioPlayer(contentsOf: url!) // load sound
        player.play()
                
    }
}


