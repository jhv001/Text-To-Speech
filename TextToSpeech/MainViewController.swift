//
//  ViewController.swift
//  TextToSpeech
//
//  Created by moDi on 14/4/20.
//  Copyright © 2020 JV. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var textView1: UITextView!
    
    @IBOutlet var presetButtonGroup: [MyButton]!
    
    @IBAction func cancelButton(_ sender: UIButton) {
        textView1.text = ""
        textView1.resignFirstResponder()
        stopSpeaking()
    }
    @IBAction func speakButton(_ sender: UIButton) {
        speak(textView1.text)
        textView1.resignFirstResponder()
    }
    @IBAction func button1(_ sender: UIButton) {
        let buttonTitle1 = presetButtonGroup[0].currentTitle ?? "nil"
        speak(buttonTitle1)
    }
    @IBAction func button2(_ sender: UIButton) {
        let buttonTitle2 = presetButtonGroup[1].currentTitle ?? "nil"
        speak(buttonTitle2)
    }
    @IBAction func button3(_ sender: UIButton) {
        let buttonTitle3 = presetButtonGroup[2].currentTitle ?? "nil"
        speak(buttonTitle3)
    }
    @IBAction func button4(_ sender: UIButton) {
        let buttonTitle4 = presetButtonGroup[3].currentTitle ?? "nil"
        speak(buttonTitle4)
    }
    @IBAction func button5(_ sender: UIButton) {
        let buttonTitle5 = presetButtonGroup[4].currentTitle ?? "nil"
        speak(buttonTitle5)
    }
    @IBAction func button6(_ sender: UIButton) {
        let buttonTitle6 = presetButtonGroup[5].currentTitle ?? "nil"
        speak(buttonTitle6)
    }
    @IBAction func button7(_ sender: UIButton) {
        let buttonTitle7 = presetButtonGroup[6].currentTitle ?? "nil"
        speak(buttonTitle7)
    }
    @IBAction func button8(_ sender: UIButton) {
        let buttonTitle8 = presetButtonGroup[7].currentTitle ?? "nil"
        speak(buttonTitle8)
    }
    @IBAction func button9(_ sender: UIButton) {
        let buttonTitle9 = presetButtonGroup[8].currentTitle ?? "nil"
        speak(buttonTitle9)
    }
    @IBAction func button10(_ sender: UIButton) {
        let buttonTitle10 = presetButtonGroup[9].currentTitle ?? "nil"
        speak(buttonTitle10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView1.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //read saved settings and call refresh methods to update view
        readSettings()
        findSavedVoice()
        refreshMainButtonValues(currentButtons)
        refreshMainTheme(currentTheme)
    }
    
    func refreshMainButtonValues(_ buttons: [String]) {
        //refresh the Main view button titles
        for (index, button) in buttons.enumerated() {
            presetButtonGroup[index].setTitle(button, for: .normal)
            //print("\(index), \(button)")
            }
    }

    func refreshMainTheme(_ theme: Int) {
        //refresh the colour scheme of the main view
        updateTheme(theme)
        self.view.backgroundColor = viewBackground
    }

    
    func textViewDidBeginEditing(_ textView: UITextView) {
        //this function is called when the text view is tapped
        //clear the textview
        textView.text = ""
    }
    @IBAction func unwindToMainView(sender: UIStoryboardSegue)
    {
        // Pull any data from the view controller which initiated the unwind segue.
    }
}
