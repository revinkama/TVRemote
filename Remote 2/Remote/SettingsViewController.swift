//
//  SettingsViewController.swift
//  Remote
//
//  Created by Kevin Rama on 2/27/19.
//  Copyright © 2019 Kevin Rama. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var segOptions: UISegmentedControl!
    
    var cancelPressed: Bool = false;
    
    
    @IBAction func cancel(_ sender: Any) {
        channelLabel.text = String(1);
        label.text = "";
        cancelPressed = true;
    }
    
    
    @IBAction func Stepper(_ sender: UIStepper) {
        
        var temp: String = "";
        temp = String(format: "%.0f", sender.value);
        
        channelLabel.text = temp;
        
        if(cancelPressed == true){
            channelLabel.text = String(1);
            cancelPressed = false;
        }
        
    }

    
    func validLabelCheck(_ value: String) -> Bool{
        do{
            if (value == "" || value.count > 4){
                return false;
            }
        }
        return true;
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        if(validLabelCheck(label.text!) == false){
            let labelConfirm = UIAlertController(title: "Channel Label Error", message: "Length of Label has to be between 1 and 4 characters", preferredStyle: .alert);
            labelConfirm.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            self.present(labelConfirm, animated: true, completion: nil);
        }
        else{
            let tabBar = tabBarController as! BaseTabBarController;
            
            let getindex = segOptions.selectedSegmentIndex;
            
            switch (getindex) {
            case 0:
                tabBar.channelName0 = label.text!;
                tabBar.channelNumber0 = Int(channelLabel.text!)!;
            case 1:
                tabBar.channelName1 = label.text!;
                tabBar.channelNumber1 = Int(channelLabel.text!)!;
            case 2:
                tabBar.channelName2 = label.text!;
                tabBar.channelNumber2 = Int(channelLabel.text!)!;
            case 3:
                tabBar.channelName3 = label.text!;
                tabBar.channelNumber3 = Int(channelLabel.text!)!;
            default:
                tabBar.channelName0 = "1"
                tabBar.channelNumber0 = 1;
            }
            
            let confirm = UIAlertController(title: "Success!", message: "Favorite Channels Have Been Updated", preferredStyle: .alert);
            
            confirm.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            self.present(confirm, animated: true, completion: nil);
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segOptions.selectedSegmentIndex = 0;

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
