//
//  ViewController.swift
//  PListSwift
//
//  Created by MAC OS on 6/7/17.
//  Copyright © 2017 MAC OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btncreatePlist(_ sender: Any)
    {
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String;
        let path=docDir.appending("/profile.plist");
        
        if(!FileManager().fileExists(atPath: path))
        {
            print(path);
            
            let data : [String: String] = [
                "Company": "My Company",
                "FullName": "My Full Name",
                "FirstName": "My First Name",
                "LastName": "My Last Name",
                // any other key values
            ];
            
            let someData = NSDictionary(dictionary: data);
            let isWritten = someData.write(toFile: path, atomically: true);
            print("is the file created: \(isWritten)");
            
        }
        else
        {
            print("file exists");
        }
    }
    
    @IBAction func btnDisplayPlist(_ sender: Any)
    {
        let document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString;
        let path = document.appending("/profile.plist");
        
        let somedata = NSDictionary(contentsOfFile: path);
        
        print(somedata!);
    }

}

