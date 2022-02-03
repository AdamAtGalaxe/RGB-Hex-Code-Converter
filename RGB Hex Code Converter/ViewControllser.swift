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
    
    @IBOutlet weak var colorView: UIView!
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
        alphaTextField.text?.removeAll()
        
    }
    
    @IBAction func convertAction(_ sender: UIButton) {

        switch conversion {
        case .hexToRGB:
            colorView.backgroundColor = convertHexToRGB()
        case .RGBToHex:
            colorView.backgroundColor = convertRGBToHex()
        }
        
    }
    
    func convertHexToRGB()->UIColor?{
        guard let redText = UInt8(redTextField.text!, radix: 16) else{ return nil }
        
        guard let greenText = UInt8(greenTextField.text!, radix: 16) else{ return nil}
        
        guard let blueText = UInt8(blueTextField.text!, radix: 16) else{ return nil}
        
        guard let alphaText = Float(alphaTextField.text!) else{ return nil  }
        if(alphaText>1 || alphaText<0) { return nil}

        
        resultsLsbel.text = "Red: \(redText)\nGreen: \(greenText)\nBlue: \(blueText)\nAlpha: \(alphaText)"
        let backgroundColor = UIColor(displayP3Red: CGFloat(redText), green: CGFloat(greenText), blue: CGFloat(blueText), alpha: CGFloat(alphaText))
        
        return backgroundColor
    }
    func convertRGBToHex()->UIColor?{
        guard let redText = UInt8(redTextField.text!) else{ return nil }
        
        guard let greenText = UInt8(greenTextField.text!) else{ return nil}
        
        guard let blueText = UInt8(blueTextField.text!) else{ return nil}
        
        guard let alphaText = Float(alphaTextField.text!) else{ return nil  }
        if(alphaText>1 || alphaText<0) { return nil}
        
        let redString = String(format: "%2X", redText)
        let greenString = String(format: "%2X", greenText)
        let blueString = String(format: "%2X", blueText)
        
        resultsLsbel.text = "HexCode: #\(redString)\(greenString)\(blueString)\nAlpha: \(alphaText)"
        let backgroundColor = UIColor(displayP3Red: CGFloat(redText), green: CGFloat(greenText), blue: CGFloat(blueText), alpha: CGFloat(alphaText))
        
        return backgroundColor
        
    }

}
