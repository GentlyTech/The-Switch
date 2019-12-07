//
//  ViewController.swift
//  The Switch
//
//  Created by Andy Yep on 2019-10-12.
//  Copyright © 2019 Andy Yep. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Switch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { Switch.isEnabled = false; return }
    }


    func toggleFlash() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }

        do {
            try device.lockForConfiguration()

            if (device.torchMode == AVCaptureDevice.TorchMode.on) {
                device.torchMode = AVCaptureDevice.TorchMode.off
            } else {
                do {
                    try device.setTorchModeOn(level: 1.0)
                } catch {
                    print(error)
                }
            }

            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
    @IBAction func OnChange(_ sender: Any) {
        
        AudioServicesPlaySystemSound(1057);
        
        toggleFlash()
        
        if (Switch.isOn)
        {
            Label.text = "Torch: On"
            overrideUserInterfaceStyle = .light
            
            navigationController?.navigationBar.barStyle = .black
        }
        else
        {
            Label.text = "Torch: Off"
            overrideUserInterfaceStyle = .dark
            
            navigationController?.navigationBar.barStyle = .default
        }
        
    }
    
}

