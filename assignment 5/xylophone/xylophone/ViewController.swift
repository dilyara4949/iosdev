//
//  ViewController.swift
//  xylophone
//
//  Created by Dilyara Mukhambetova on 10/15/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func PlayButton(_ sender: UIButton) {
        guard let playedButton = sender.titleLabel!.text else {
            return
        }
        
        guard let url = Bundle.main.url(forResource: playedButton, withExtension: "wav") else {
            print("sound not found")
            return
        }
        
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        guard let player = audioPlayer else {
            print("Failed to initialize audio player")
            return
        }

        player.play()
    }
    
}

