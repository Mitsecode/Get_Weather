//
//  ViewController.swift
//  Get_Weather
//
//  Created by Mit Sengupta on 30/7/17.
//  Copyright © 2017 Mit Sengupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var background: UIImageView!
    
    let url = URL(string: "http://www.weather-forecast.com/locations/")
    
    
    
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var summary: UILabel!
    
    
    
    @IBAction func getWeather(_ sender: Any) {
        
        if ((textField.text?.components(separatedBy: " ")) != nil) {
            print("yes")
     
        }
        
       
        
        
        
        let URLL = URL(string:"http://www.weather-forecast.com/locations/" + textField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest")
        
        print(URLL)
        
        
        if let url = URLL {
        
        let request = NSMutableURLRequest(url: url)
        
        
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                
                data, response, error in
                
                if error != nil {
                    print(error)
                    
                } else {
                    
                    if let unwrappedData = data {
                        
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        
                        
                        DispatchQueue.main.sync(execute: {
                            
                            
                            
                            
                             let start = dataString?.localizedStandardRange(of: "phrase").location
                            
                            let finish = dataString?.localizedStandardRange(of: "units-cont").location
                            
                            var length = finish! - start!

                            print(length)
                          
                            
                            let data = dataString?.substring(with: NSRange(location: start! + 8, length: length - 72))
                            
                            
                            print(data)
                            
                            
                            
                            self.summary.text = data
                            
                           // Update UI
                        
                       
                        
                        })
                        
                        
                    }
                    
                }
                
                
            
                
                
                
                
            }
        
        
        task.resume()
        
        
    }
        
        
        
        
        
        
        
    
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }



}

