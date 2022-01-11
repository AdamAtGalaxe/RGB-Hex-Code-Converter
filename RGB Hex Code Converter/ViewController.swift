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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectSegmentAction(_ sender: UISegmentedControl) {
    }
    
    @IBAction func convertAction(_ sender: UIButton) {
    }
    

}

