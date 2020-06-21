//
//  Speech.swift
//  TextToSpeech
//
//  Created by moDi on 24/5/20.
//  Copyright © 2020 JV. All rights reserved.
//

import UIKit
import AVFoundation

/*
 UserDefaults keys:
 - buttons -> string array of button titles
 - theme -> integer value (0 - 5) representing each preset colour theme
 - pitch -> voice pitch value
 - rate -> speech rate value
 - langauge -> voice language
*/
let defaults = UserDefaults.standard

let defaultButtons: [String] = ["button1", "button2", "button3", "button4", "button5", "button6", "button7", "button8", "button9", "button10"]
let defaultTheme: Int = 0
let defaultPitch: Float = 1.0
let defaultRate: Float = 0.5
let defaultVoice: AVSpeechSynthesisVoice? = nil

var currentButtons: [String] = [String]()
var currentTheme: Int = 0

var viewBackground: UIColor?
var buttonBackground: UIColor?
var buttonText: UIColor?
var themeButtonBackground: UIColor?
var themeButtonText: UIColor?
var labelAndTrackColour: UIColor?

func updateTheme(_ newTheme: Int) {
    switch newTheme {
    case 0:
        viewBackground = #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)
        themeButtonBackground = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        labelAndTrackColour = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
    case 1:
        viewBackground = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        themeButtonBackground = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        labelAndTrackColour = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    case 2:
        viewBackground = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
        themeButtonBackground = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        labelAndTrackColour = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
    case 3:
        viewBackground = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        themeButtonBackground = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        labelAndTrackColour = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
    case 4:
        viewBackground = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        themeButtonBackground = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        labelAndTrackColour = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
    case 5:
        viewBackground = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
        themeButtonBackground = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        labelAndTrackColour = #colorLiteral(red: 0.5738074183, green: 0.5655357838, blue: 0, alpha: 1)
    default:
        break
    }
}

func readSettings() {
     // Reading from NSUserDefaults.
     if let savedButtons = defaults.object(forKey: "buttons") as? [String] {
        currentButtons = savedButtons
     } else {
        currentButtons = defaultButtons
    }
    if let savedTheme = defaults.object(forKey: "theme") as? Int {
        currentTheme = savedTheme
    } else {
        currentTheme = defaultTheme
    }
    if let savedPitch = defaults.object(forKey: "pitch") as? Float {
        voicePitch = savedPitch
    } else {
        voicePitch = defaultPitch
    }
    if let savedRate = defaults.object(forKey: "rate") as? Float {
        speechRate = savedRate
    } else {
        speechRate = defaultRate
    } 
    if let savedVoice = defaults.object(forKey: "voiceID") as? String {
        voiceIdentifier = savedVoice
    }
}

func saveSettings(buttons: [String], theme: Int, pitch: Float?, rate: Float?, voiceID: String?) {
    defaults.set(buttons, forKey: "buttons")
    defaults.set(theme, forKey: "theme")
    defaults.set(pitch, forKey: "pitch")
    defaults.set(rate, forKey: "rate")
    defaults.set(voiceID, forKey: "voiceID")
}
