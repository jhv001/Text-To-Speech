//
//  SettingsViewController.swift
//  TextToSpeech
//
//  Created by moDi on 25/5/20.
//  Copyright © 2020 JV. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var buttonIndex: Int?

    @IBOutlet var presetButtons: [UIButton]!
    @IBOutlet var themeButton: MyButton!
    @IBOutlet var resetSpeechButton: MyButton!
    @IBOutlet var voicePitchSlider: UISlider!
    @IBOutlet var speechRateSlider: UISlider!
    @IBOutlet var pitchSliderLabel: UILabel!
    @IBOutlet var rateSliderLabel: UILabel!
    @IBOutlet var voiceLanguage: UILabel!
    @IBOutlet var voiceName: UILabel!
    @IBOutlet var labels: [UILabel]!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // dismiss view
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: UIBarButtonItem) {
        //update currentButtons paramater with current button values
        currentButtons = [String]()
        for i in 0 ... 9 {
            currentButtons.append(presetButtons[i].currentTitle!)
        }
        // save settings to UserDefaults
        voiceIdentifier = voiceToUse?.identifier
        saveSettings(
            buttons: currentButtons,
            theme: currentTheme,
            pitch: voicePitch,
            rate: speechRate,
            voiceID: voiceIdentifier)
        
        // dismiss view
        dismiss(animated: true, completion: nil)
    }
    @IBAction func updateVoicePitch(_ sender: UISlider) {
        voicePitch = voicePitchSlider.value
    }
    @IBAction func updateSpeechRate(_ sender: UISlider) {
        speechRate = speechRateSlider.value
    }
    @IBAction func resetVoice(_ sender: UIButton) {
        voicePitchSlider.setValue(defaultPitch, animated: true)
        speechRateSlider.setValue(defaultRate, animated: true)
        voiceToUse = defaultVoice
        voiceIdentifier = nil
        speechRate = defaultRate
        voicePitch = defaultPitch
        refreshLabels()
    }
    @IBAction func theme(_ sender: UIButton) {
        if currentTheme < 5 {
            currentTheme += 1
        } else {
            currentTheme = 0
        }
        refreshSettingsTheme(currentTheme)
        }
    @IBAction func defaultValues(_ sender: UIButton) {
        //refresh UI with default values.
        //NOTE: defaults not saved until "Save" button selected.
        currentTheme = defaultTheme
        voicePitch = defaultPitch
        speechRate = defaultRate
        voiceToUse = defaultVoice
        voicePitchSlider.setValue(defaultPitch, animated: true)
        speechRateSlider.setValue(defaultRate, animated: true)
        refreshLabels()
        refreshSettingsButtonValues(defaultButtons)
        refreshSettingsTheme(currentTheme)
    }
    @IBAction func button1(_ sender: UIButton) {
        buttonIndex = 0
        alertView()
    }
    @IBAction func button2(_ sender: UIButton) {
        buttonIndex = 1
        alertView()
    }
    @IBAction func button3(_ sender: UIButton) {
        buttonIndex = 2
        alertView()
    }
    @IBAction func button4(_ sender: UIButton) {
        buttonIndex = 3
        alertView()
    }
    @IBAction func button5(_ sender: UIButton) {
        buttonIndex = 4
        alertView()
    }
    @IBAction func button6(_ sender: UIButton) {
        buttonIndex = 5
        alertView()
    }
    @IBAction func button7(_ sender: UIButton) {
        buttonIndex = 6
        alertView()
    }
    @IBAction func button8(_ sender: UIButton) {
        buttonIndex = 7
        alertView()
    }
    @IBAction func button9(_ sender: UIButton) {
        buttonIndex = 8
        alertView()
    }
    @IBAction func button10(_ sender: UIButton) {
        buttonIndex = 9
        alertView()
    }
    
    func alertView() {
        
        let alert = UIAlertController(
        title: "Change Button Name",
        message: "Please enter a new name for the button",
        preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = self.presetButtons[self.buttonIndex!].currentTitle
            //textField.text = self.presetButtons[self.buttonIndex!].currentTitle
            textField.clearButtonMode = .always
            }
        
        alert.addAction(UIAlertAction(title: "Cancel" , style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            let textField = alert.textFields![0] as UITextField
            if textField.hasText {
                let newTitle = textField.text!
                self.presetButtons[self.buttonIndex!].setTitle(newTitle, for: .normal)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func refreshSettingsButtonValues(_ buttons: [String]) {
        //refresh the Settings view
        for (index, button) in buttons.enumerated() {
            presetButtons[index].setTitle(button, for: .normal)
        }
    }

    func refreshSettingsTheme(_ theme: Int) {
        updateTheme(theme)
        self.view.backgroundColor = viewBackground
        self.themeButton.backgroundColor = themeButtonBackground
        voicePitchSlider.minimumTrackTintColor = labelAndTrackColour
        voicePitchSlider.maximumTrackTintColor = labelAndTrackColour
        speechRateSlider.minimumTrackTintColor = labelAndTrackColour
        speechRateSlider.maximumTrackTintColor = labelAndTrackColour
        pitchSliderLabel.textColor = labelAndTrackColour
        rateSliderLabel.textColor = labelAndTrackColour
        voiceLanguage.textColor = labelAndTrackColour
        voiceName.textColor = labelAndTrackColour
        for label in labels {
            label.textColor = labelAndTrackColour
        }
    }
    
    func refreshSliderValues() {
        voicePitchSlider.value = voicePitch!
        speechRateSlider.value = speechRate!
    }
    
    func refreshLabels() {
        voiceLanguage.text = voiceToUse?.language ?? "Default"
        voiceName.text = voiceToUse?.name ?? "Voice"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //read saved settings and call refresh methods to update view
//        readSettings()
//        refreshSettingsButtonValues(currentButtons)
//        refreshSettingsTheme(currentTheme)
//        refreshSliderValues()
//        refreshLabels()
//        print("view did load")
    }

    override func viewWillAppear(_ animated: Bool) {
//        voiceIdentifier = voiceToUse?.identifier
        readSettings()
     //   findSavedVoice()
        refreshSettingsButtonValues(currentButtons)
        refreshSettingsTheme(currentTheme)
        refreshSliderValues()
        refreshLabels()
//        print(voiceToUse?.name ?? "none")
//        print(voiceToUse?.language ?? "none")
//        print(voiceToUse)
    }
    
  @IBAction func unwindToSettingsView(sender: UIStoryboardSegue)
  {
      // Pull any data from the view controller which initiated the unwind segue.
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
