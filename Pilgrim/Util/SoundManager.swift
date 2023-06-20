//
//  SoundManager.swift
//  Pilgrim
//
//  Created by Luiz Sena on 19/06/23.
//

import Foundation
import AVFoundation

class SoundManager{
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    func playSound(name: String){
        guard let url = Bundle.main.url(forResource: name, withExtension: ".mp3") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.05
            player?.play()
        } catch  {
            print("error")

        }
    }
}
