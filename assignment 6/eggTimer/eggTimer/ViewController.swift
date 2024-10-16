//
//  ViewController.swift
//  eggTimer
//
//  Created by Dilyara Mukhambetova on 10/15/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer: Timer?
    var audioPlayer: AVAudioPlayer?
    let eggTimes: [String: Float] = ["Hard":7.0, "Medium":5.0, "Soft":3.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetValues()
    }
    
    @IBOutlet weak var TopLabel: UILabel!
    @IBOutlet weak var ProgressTime: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    @IBAction func PressEgg(_ sender: UIButton) {
        guard let title = sender.titleLabel!.text, let totalTime = eggTimes[title] else {
            print("Cannot find button title")
            return
        }
        
        resetValues()
    
        
        var currentTime: Float = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            currentTime += 1
            self.ProgressBar.progress = currentTime / totalTime
            self.ProgressTime.text = "\(Int(self.ProgressBar.progress*100))%"
            if currentTime == totalTime {
                self.TopLabel.text = "Done!"
                self.playAlarm()
                timer.invalidate()
            }
        }
       
    }
    
    func resetValues() {
        timer?.invalidate()
        self.TopLabel.text = "Select egg type"
        self.ProgressBar.progress = 0
        self.ProgressTime.text = "0%"
    }

    func playAlarm() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
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

