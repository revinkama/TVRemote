//
//  ViewController.swift
//  Remote
//
//  Created by Kevin Rama on 2/17/19.
//  Copyright © 2019 Kevin Rama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var powerOutput: UILabel!
    @IBOutlet weak var volumeOuput: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var channelOutput: UILabel!
    @IBOutlet weak var ChannelSeg: UISegmentedControl!
    
    
    var currentVol: Int = 0;
    var currentChan: Int = 0;
    var previousNum: Int = 0;
    var enter = false;
    var power = false;
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if(powerOutput.text == "ON"){
            channelOutput.text = channelOutput.text! + String(sender.tag - 1);
            currentChan = Int(channelOutput.text!)!;
        }
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        if(powerOutput.text == "ON"){
            currentVol = Int(volumeSlider.value);
            volumeOuput.text = "\(currentVol)";
        }
    }
    
    @IBAction func FavChannels(_ sender: UISegmentedControl) {
        if(powerOutput.text == "ON"){
            let tabBar = tabBarController as! BaseTabBarController;
            
            let getIndex = ChannelSeg.selectedSegmentIndex;
            
            switch (getIndex){
            case 0:
                channelOutput.text = String(tabBar.channelNumber0);
            case 1:
                channelOutput.text = String(tabBar.channelNumber1);
            case 2:
                channelOutput.text = String(tabBar.channelNumber2);
            case 3:
                channelOutput.text = String(tabBar.channelNumber3);
            default:
                channelOutput.text = "1";
            }
        }
        
    }
    
    @IBAction func AddOrSub(_ sender: UIButton) {
        if(powerOutput.text == "ON"){
            if(channelOutput.text == ""){
                currentChan = 1;
                channelOutput.text = String(currentChan);
            }
            
            if(sender.tag == 11 && Int(channelOutput.text!)! >= 1 && Int(channelOutput.text!)! < 99){
                currentChan = Int(channelOutput.text!)!;
                channelOutput.text = String(currentChan + 1);
            }
            else if(sender.tag == 11 && Int(channelOutput.text!)! == 99){
                currentChan = 0;
                channelOutput.text = String(currentChan + 1);
            }
            else if(sender.tag == 12 && Int(channelOutput.text!)! > 1 && Int(channelOutput.text!)! <= 99){
                currentChan = Int(channelOutput.text!)!;
                channelOutput.text = String(currentChan - 1);
            }
            else if(sender.tag == 12 && Int(channelOutput.text!)! == 1){
                currentChan = 100;
                channelOutput.text = String(currentChan - 1);
            }
        }
    }
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        if(sender.isOn == true){
            powerOutput.text = "ON";
            power = true;
        }
        else {
            powerOutput.text = "OFF";
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! BaseTabBarController;
        
        ChannelSeg.setTitle(tabBar.channelName0, forSegmentAt: 0);
        ChannelSeg.setTitle(tabBar.channelName1, forSegmentAt: 1);
        ChannelSeg.setTitle(tabBar.channelName2, forSegmentAt: 2);
        ChannelSeg.setTitle(tabBar.channelName3, forSegmentAt: 3);
        
        
        
    }


}

