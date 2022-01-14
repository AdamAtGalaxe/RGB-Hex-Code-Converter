//
//  ViewController.swift
//  RGB Hex Code Converter
//
//  Created by Adam Roberts on 1/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var alphaTextField: UITextField!
    @IBOutlet weak var conversionButton: UIButton!
    @IBOutlet weak var resultsLsbel: UILabel!
    
    enum Conversion {
        case hexToRGB
        case RGBToHex
    }
    
    var conversion : Conversion = .hexToRGB
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectSegmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0 :
            conversion = .hexToRGB
            conversionButton.setTitle("Convert hex to RGB", for: .normal)
        case 1:
            conversion = .RGBToHex
            conversionButton.setTitle("Convert RGB to hx", for: .normal)
        default:
            conversion = .hexToRGB
            conversionButton.setTitle("Convert hex to RGB", for: .normal)
        }
        print(conversion)
        redTextField.text?.removeAll()
        blueTextField.text?.removeAll()
        greenTextField.text?.removeAll()
        
    }
    
    @IBAction func convertAction(_ sender: UIButton) {
        
    }
    
    func convertHexToRGB(){
        
    }
    func convertRGBToHex(){
        
    }

}
