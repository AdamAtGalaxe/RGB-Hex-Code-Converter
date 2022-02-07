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
    @IBOutlet weak var resultsLabel: UILabel!
    
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
            view.backgroundColor = convertHexToRGB()
            //colorView.backgroundColor = convertHexToRGB()
        case .RGBToHex:
            //colorView.backgroundColor = convertRGBToHex()
            view.backgroundColor = convertRGBToHex()
        }
        
    }
    
    func convertHexToRGB()->UIColor?{
        guard let redText = UInt8(redTextField.text!, radix: 16) else{ return nil }
        
        guard let greenText = UInt8(greenTextField.text!, radix: 16) else{ return nil}
        
        guard let blueText = UInt8(blueTextField.text!, radix: 16) else{ return nil}
        
        guard let alphaText = Float(alphaTextField.text!) else{ return nil  }
        if(alphaText>1 || alphaText<0) { return nil}
        
        let red : CGFloat = CGFloat(redText)/255.0
        let green : CGFloat  = CGFloat(greenText)/255.0
        let blue : CGFloat  = CGFloat(blueText)/255.0

        
        resultsLabel.text = "Red: \(redText)\nGreen: \(greenText)\nBlue: \(blueText)\nAlpha: \(alphaText)"
        
        let backgroundColor = UIColor(red: CGFloat(redText)/255.0, green: CGFloat(greenText)/255.0, blue: CGFloat(blueText)/255.0, alpha: CGFloat(alphaText))
        
        resultsLabel.backgroundColor = UIColor(red: getLabelColor(red), green: getLabelColor(green), blue: getLabelColor(blue), alpha: 1)
        
        return backgroundColor
    }
    func convertRGBToHex()->UIColor?{
        guard let redText = UInt8(redTextField.text!) else{ return UIColor.white }
        
        guard let greenText = UInt8(greenTextField.text!) else{ return UIColor.white}
        
        guard let blueText = UInt8(blueTextField.text!) else{ return UIColor.white}
        
        guard let alphaText = Float(alphaTextField.text!) else{ return UIColor.white  }
        if(alphaText>1 || alphaText<0) { return nil}
        
        let red : CGFloat = CGFloat(redText)/255.0
        let green : CGFloat  = CGFloat(greenText)/255.0
        let blue : CGFloat  = CGFloat(blueText)/255.0
        
        let redString = String(format: "%02X", redText)
        let greenString = String(format: "%02X", greenText)
        let blueString = String(format: "%02X", blueText)
        
        if(red+green+blue>0.80){
            resultsLabel.textColor = .black
        }
        else{
            resultsLabel.textColor = .white
        }
        //let test : String = (pad: greenString, toWidth: 3, using: "0")
        resultsLabel.text = "HexCode: #\(redString)\(greenString)\(blueString)\nAlpha: \(alphaText)"
        
        let myBackgroundColor = UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alphaText))
        
        resultsLabel.backgroundColor = UIColor(red: getLabelColor(red), green: getLabelColor(green), blue: getLabelColor(blue), alpha: 1)
 
        //resultsLsbel.textColor = .white

    
            
        return myBackgroundColor
        
    }
    func getLabelColor(_ color: CGFloat) ->CGFloat {
        print(color)
        //if color == 0.0 { return 0 }
         if color <= 0.2{
            return color+0.15
        }
        else if color > 0.2 && color <= 0.50 {
            return color+(color*0.15)
        }
        else if color > 0.5 && color < 0.8 {
            return color-(color*0.15)
        }
        else { return color-0.15}
            
    }
    

}
