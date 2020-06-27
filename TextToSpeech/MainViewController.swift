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
    @IBOutlet var clearButton: MyButton!
    
    @IBOutlet var presetButtonGroup: [MyButton]!
    
    @IBAction func clearText(_ sender: UIButton) {
        textView1.text = ""
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        textView1.text = ""
        textView1.resignFirstResponder()
        stopSpeaking()
    }
    @IBAction func speakButton(_ sender: UIButton) {
        speak(textView1.text)
//        textView1.resignFirstResponder()
    }
    @IBAction func button1(_ sender: UIButton) {
        let buttonTitle1 = presetButtonGroup[0].currentTitle ?? "nil"
        speak(buttonTitle1)
        textView1.text = buttonTitle1
    }
    @IBAction func button2(_ sender: UIButton) {
        let buttonTitle2 = presetButtonGroup[1].currentTitle ?? "nil"
        speak(buttonTitle2)
        textView1.text = buttonTitle2
    }
    @IBAction func button3(_ sender: UIButton) {
        let buttonTitle3 = presetButtonGroup[2].currentTitle ?? "nil"
        speak(buttonTitle3)
        textView1.text = buttonTitle3
    }
    @IBAction func button4(_ sender: UIButton) {
        let buttonTitle4 = presetButtonGroup[3].currentTitle ?? "nil"
        speak(buttonTitle4)
        textView1.text = buttonTitle4
    }
    @IBAction func button5(_ sender: UIButton) {
        let buttonTitle5 = presetButtonGroup[4].currentTitle ?? "nil"
        speak(buttonTitle5)
        textView1.text = buttonTitle5
    }
    @IBAction func button6(_ sender: UIButton) {
        let buttonTitle6 = presetButtonGroup[5].currentTitle ?? "nil"
        speak(buttonTitle6)
        textView1.text = buttonTitle6
    }
    @IBAction func button7(_ sender: UIButton) {
        let buttonTitle7 = presetButtonGroup[6].currentTitle ?? "nil"
        speak(buttonTitle7)
        textView1.text = buttonTitle7
    }
    @IBAction func button8(_ sender: UIButton) {
        let buttonTitle8 = presetButtonGroup[7].currentTitle ?? "nil"
        speak(buttonTitle8)
        textView1.text = buttonTitle8
    }
    @IBAction func button9(_ sender: UIButton) {
        let buttonTitle9 = presetButtonGroup[8].currentTitle ?? "nil"
        speak(buttonTitle9)
        textView1.text = buttonTitle9
    }
    @IBAction func button10(_ sender: UIButton) {
        let buttonTitle10 = presetButtonGroup[9].currentTitle ?? "nil"
        speak(buttonTitle10)
        textView1.text = buttonTitle10
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
        textView1.textContainerInset.left = 8
        textView1.textContainerInset.right = 8
        textView1.textContainerInset.top = 8
        textView1.contentInset.bottom = clearButton.frame.height
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
        clearButton.setImage(UIImage(named: "cross.normal.png"), for: .normal)
//        clearButton.setImage(UIImage(named: "cross.selected.png"), for: .highlighted)

        if textView.hasText {
            DispatchQueue.main.async {
                textView.selectAll(nil)
            }
        }

        
/*
        //create an exclusion path in the textview so text wraps around the clear button
        let exclusionPath = UIBezierPath(rect: clearButton.frame)
        textView.textContainer.exclusionPaths = [exclusionPath]
*/
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //remove the clear button from view when editing ends
        clearButton.setImage(nil, for: .normal)
//        clearButton.setImage(nil, for: .highlighted)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //view.endEditing(true)
//        textView1.resignFirstResponder()
//    }
        
    @IBAction func unwindToMainView(sender: UIStoryboardSegue)
    {
        // Pull any data from the view controller which initiated the unwind segue.
    }
}
