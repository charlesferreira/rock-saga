//
//  GuitarStrikeFXView.swift
//  RockSaga
//
//  Created by Charles Ferreira on 04/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import AVFoundation
import UIKit

class GuitarStrikeFXView: UIImageView {
    
//    static let audioEngine = AVAudioEngine()
    
    var pitch: Float = 0
    
//    var engineSound = URL(fileURLWithPath: Bundle.main.path(forResource: "guitar.wav", ofType: nil)!)
//    var audioFilePlayer: AVAudioPlayerNode!
//    var auTimePitch: AVAudioUnitTimePitch!
//    var audioFileBuffer: AVAudioPCMBuffer!
    
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        alpha = 0.6
        transform = transform.scaledBy(x: 0.5, y: 0.5)
        
        rotate(withDuration: 1, repeating: true)
        
        
//        let audioEngine = GuitarStrikeFXView.audioEngine
        
        UIView.animate(withDuration: 1, animations: {
            self.transform = self.transform.scaledBy(x: 3, y: 3)
            self.alpha = 0
        }) { (_) in
//            self.audioFilePlayer.stop()
//            audioEngine.disconnectNodeOutput(self.auTimePitch)
//            audioEngine.disconnectNodeOutput(self.audioFilePlayer)
//            audioEngine.detach(self.auTimePitch)
//            audioEngine.detach(self.audioFilePlayer)
            self.removeFromSuperview()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
//        audioFilePlayer = AVAudioPlayerNode()
//
//        let filePath = Bundle.main.path(forResource: "guitar_stereo", ofType: "wav")!
//        let fileURL = URL(fileURLWithPath: filePath)
//        let audioFile = try! AVAudioFile(forReading: fileURL)
//        let audioFormat = audioFile.processingFormat
//        let audioFrameCount = UInt32(audioFile.length)
//        audioFileBuffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: audioFrameCount)
//        try! audioFile.read(into: audioFileBuffer)
//
//        let mainMixer = audioEngine.mainMixerNode
//        audioEngine.attach(audioFilePlayer)
//
//        auTimePitch = AVAudioUnitTimePitch()
//        auTimePitch.pitch = pitch * 500
//        audioEngine.attach(auTimePitch)
//        audioEngine.connect(audioFilePlayer, to: auTimePitch, format: mainMixer.outputFormat(forBus: 0))
//        audioEngine.connect(auTimePitch, to: mainMixer, format: mainMixer.outputFormat(forBus: 0))
        
//        try! audioEngine.start()
//        audioFilePlayer.play()
//        audioFilePlayer.scheduleBuffer(audioFileBuffer, at: nil, options: [], completionHandler: nil)
    }
    
}

