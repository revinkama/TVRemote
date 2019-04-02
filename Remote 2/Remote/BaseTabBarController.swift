//
//  BaseTabBarController.swift
//  Remote
//
//  Created by Kevin Rama on 3/5/19.
//  Copyright © 2019 Kevin Rama. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    var channelNumber0: Int = 1;
    var channelNumber1: Int = 1;
    var channelNumber2: Int = 1;
    var channelNumber3: Int = 1;
    
    var channelName0: String = "1";
    var channelName1: String = "2";
    var channelName2: String = "3";
    var channelName3: String = "4";

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
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
