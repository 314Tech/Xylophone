//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        play("note\(sender.tag)")
        
    }
    
    func play(_ soundFileName: String) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "wav") else { return
        }
        
        do {
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        audioPlayer.play()
    }

}

