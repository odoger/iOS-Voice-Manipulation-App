//
//  ViewController.swift
//  Voice Manipulation App
//
//  Created by Oğuz Döğer on 21.11.2017.
//  Copyright © 2017 Oguz Doger. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioRecorder : AVAudioRecorder!

    
    @IBOutlet weak var lblRecording: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

   
    @IBAction func btnRecord(_ sender: Any) {
        lblRecording.text = "Record in Progress"
        recordButton.isEnabled = false
        stopRecordingButton.isEnabled = true
        
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    @IBAction func btnStopRecording(_ sender: Any) {
        lblRecording.text = "Tap to Record"
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
    }
    
}

