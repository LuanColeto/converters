//
//  ViewController.swift
//  Conversores
//
//  Created by Luan Motta on 23/02/20.
//  Copyright © 2020 Luan Coleto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dolar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilometro", for: .normal)
            default:
                 lbUnit.text = "Temperatura"
                 btUnit1.setTitle("Celsius", for: .normal)
                 btUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrence()
            default:
                calcDistance()
        }
        view.endEditing(true)
        let result = Double(labelResult.text!)!
        labelResult.text = String(format: "%.2f", result)
        
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            labelResultUnit.text = "Farenheint"
            labelResult.text = String(temperature * 1.8 + 32.0)
        
        } else {
            labelResultUnit.text = "Celsius"
            labelResult.text = String((temperature - 32) / 1.8)

        }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
               
       if btUnit1.alpha == 1.0 {
           labelResultUnit.text = "Libra"
        labelResult.text = String(weight / 2.2046)
       } else {
           labelResultUnit.text = "Kilograma"
           labelResult.text = String(weight * 2.2046)
       }
    }
    
    func calcCurrence() {
        guard let currency = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            labelResultUnit.text = "Dólar"
            labelResult.text = String(currency / 4.3)
        } else {
            labelResultUnit.text = "Real"
            labelResult.text = String(currency * 4.3)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            labelResultUnit.text = "Kilômetro"
            labelResult.text = String(distance / 1000.0)
        } else {
            labelResultUnit.text = "Metros"
            labelResult.text = String(distance * 1000.0)
        }
        
    }

}
