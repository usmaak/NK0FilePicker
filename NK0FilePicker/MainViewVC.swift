//
//  ViewController.swift
//  NK0FilePicker
//
//  Created by Scott Kilbourn on 7/16/18.
//  Copyright © 2018 Scott Kilbourn. All rights reserved.
//

import UIKit
import NKOColorPickerView
import ChameleonFramework

class MainViewVC: UIViewController {
    @IBOutlet weak var colorView: UIControl!
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorView.layer.borderColor = UIColor.lightGray.cgColor
        colorView.layer.borderWidth = 0.8
        colorView.layer.cornerRadius = 6

    }

    override func viewDidLayoutSubviews() {
        colorLabel.layer.borderColor = UIColor.lightGray.cgColor
        colorLabel.layer.borderWidth = 0.8
        colorLabel.layer.cornerRadius = 6
        colorLabel.layer.masksToBounds = true
    }
    
    @IBAction func openColorSelector(_ sender: UIControl) {
        performSegue(withIdentifier: "ShowColorSelector", sender: nil)
    }
    
    @IBAction func returnFromColorSelector(segue: UIStoryboardSegue) {
        let vc = segue.source as? ColorSelectorVC
        
        colorView.backgroundColor = vc?.setColor
        colorLabel.backgroundColor = vc?.setColor
        colorLabel.textColor = ContrastColorOf(vc!.setColor, returnFlat: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ColorSelectorVC
        
        vc?.setColor = colorView.backgroundColor
    }
}

