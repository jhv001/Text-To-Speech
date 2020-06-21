//
//  Speech.swift
//  TextToSpeech
//
//  Created by moDi on 24/5/20.
//  Copyright © 2020 JV. All rights reserved.
//

//import Foundation //verify if this is needed
import UIKit
import AVFoundation

//convert this into a class?
//class MyVoice {

    let synthesizer = AVSpeechSynthesizer()
    let voices = AVSpeechSynthesisVoice.speechVoices()

    var speechRate: Float?
    var voicePitch: Float?
    var voiceToUse: AVSpeechSynthesisVoice?
    var voiceIdentifier: String?

    func speak(_ words: String) {
        do {
           try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        
        let utterance = AVSpeechUtterance(string: words)
        findSavedVoice()

        if let customVoice = voiceToUse {
            utterance.voice = customVoice
//            print(voiceToUse!.identifier)
        }
        utterance.rate = speechRate ?? defaultRate
        utterance.pitchMultiplier = voicePitch ?? defaultPitch
        
        synthesizer.speak(utterance)
        
        
//        print(voiceToUse!.identifier)
    }

    func stopSpeaking() {
        synthesizer.stopSpeaking(at: .immediate)
    }

    func findSavedVoice() {
        for voice in voices {
            // find voice to use using by matching voice identifier
            if voice.identifier == voiceIdentifier {
                voiceToUse = voice
                break
            } else {
                voiceToUse = defaultVoice
            }
        }
    }

    
//}         //class closing brace
