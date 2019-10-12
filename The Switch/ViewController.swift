//
//  ViewController.swift
//  The Switch
//
//  Created by Andy Yep on 2019-10-12.
//  Copyright © 2019 Andy Yep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Switch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
    }
    
    

    @IBAction func OnChange(_ sender: Any) {
        
        if (Switch.isOn)
        {
            Label.text = "Switch: On"
            overrideUserInterfaceStyle = .light
            
            navigationController?.navigationBar.barStyle = .default
        }
        else
        {
            Label.text = "Switch: Off"
            overrideUserInterfaceStyle = .dark
            
            navigationController?.navigationBar.barStyle = .black
        }
        
    }
    
}

