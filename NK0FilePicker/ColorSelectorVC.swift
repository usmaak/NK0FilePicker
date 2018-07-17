//
//  ColorSelectorVC.swift
//  NK0FilePicker
//
//  Created by Scott Kilbourn on 7/16/18.
//  Copyright © 2018 Scott Kilbourn. All rights reserved.
//

import UIKit
import NKOColorPickerView
import Colorkit

class ColorSelectorVC: UIViewController {
    @IBOutlet weak var positionView: UIView!
    @IBOutlet weak var currentColorView: UIView!
    @IBOutlet weak var hexValue: UILabel!
    var setColor: UIColor!
    var colorSelector2: NKOColorPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        colorSelector2 = NKOColorPickerView(frame: CGRect(x: 0, y: 0, width: positionView.frame.width, height: positionView.frame.height), color: setColor, andDidChangeColorBlock: { (color) in
            self.currentColorView.backgroundColor = color
            self.hexValue.text = color?.toHexString()
        })
        
        currentColorView.layer.borderWidth = 1
        currentColorView.layer.borderColor = UIColor.darkGray.cgColor
        currentColorView.layer.cornerRadius = 4
        
        positionView.addSubview(colorSelector2)
        colorSelector2.color = setColor
        currentColorView.backgroundColor = setColor
        hexValue.text = setColor.toHexString()
    }
    
    override func viewDidLayoutSubviews() {
        colorSelector2.frame = CGRect(x: 0, y: 0, width: positionView.frame.width, height: positionView.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        setColor = colorSelector2.color
        performSegue(withIdentifier: "CloseColorSelector", sender: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
