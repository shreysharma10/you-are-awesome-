//
//  ViewController.swift
//  you are awesome!
//
//  Created by Shrey Sharma on 1/23/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    
    var soundNumber = -1
    var imageNumber = -1
    var messageNumber = -1
    let totalNumOfImages = 9
    
    var audioPlayer: AVAudioPlayer!
    let totalNumOfSounds = 6
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")

            }
        } else {
            print("ERROR: Could not read data from file sound0")
        }
    
    }
    
    func nonRepeatingRandom(originalNumber : Int, upperLimit: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great",
                        "You Are Fantastic!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "Fabulous? That's You!",
                        "You've Got the Design Skills of Johnny Ive" ]
       
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumOfImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumOfSounds-1)
        
        if playSoundSwitch.isOn {
            playSound(name: "sound\(soundNumber)")

        }
    }

    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn  && audioPlayer != nil {
            audioPlayer.stop() //stop playing
        }
    
    }
    
}
