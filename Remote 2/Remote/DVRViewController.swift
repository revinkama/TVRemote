//
//  DVRViewController.swift
//  Remote
//
//  Created by Kevin Rama on 2/21/19.
//  Copyright © 2019 Kevin Rama. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    var playPressed = false;
    var stopPressed = false;
    
    @IBAction func switchToTV(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "DVRToTV", sender: self);
    }
    
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            self.powerLabel.text = "ON";
        }
        else {
            self.powerLabel.text = "OFF";
        }
    }
    
    
    @IBAction func buttonsDVR(_ sender: UIButton) {
        if(self.powerLabel.text == "ON"){
            if(sender.tag == 1){
                self.statusLabel.text = "Playing";
            }
            else if(sender.tag == 2){
                self.statusLabel.text = "Stopped";
            }
            
            else if(sender.tag == 3 && self.statusLabel.text == "Playing"){
                self.statusLabel.text = "Paused";
            }
            else if(sender.tag == 4 && self.statusLabel.text == "Playing"){
                self.statusLabel.text = "Fast For.";
            }
            else if(sender.tag == 5 && self.statusLabel.text == "Playing"){
                self.statusLabel.text = "Fast Rew.";
            }
            else if(sender.tag == 6 && self.statusLabel.text == "Stopped"){
                self.statusLabel.text = "Recording";
            }
            else if((statusLabel.text == "Recording") && (sender.tag == 1) || (statusLabel.text == "Recording") && (sender.tag == 3) || (statusLabel.text == "Recording") && (sender.tag == 4) || (statusLabel.text == "Recording") && (sender.tag == 5)){
                
                let alert = UIAlertController(title: "Error", message: "Cannot Play, Pause, Fast For., or Fast Rew, while Recording", preferredStyle: .alert);
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
                self.present(alert, animated: true, completion: nil);
                
            }
            else {
                if(sender.tag == 3){
                    alert(sender.tag, label: "Paused");
                }
                else if(sender.tag == 4){
                    alert(sender.tag, label: "Fast For.");
                }
                else if(sender.tag == 5){
                    alert(sender.tag, label: "Fast Rew.");
                }
                
            }
        }
    }
    
    
    
    func alert(_ sender: Int, label: String){
        
        let alert = UIAlertController(title: "Wrong Button Alert", message: "(Cancel) To Cancel Operation, or (Approve) To Force Operation", preferredStyle: .actionSheet);
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);
        alert.addAction(cancel);
        let approve = UIAlertAction(title: "Approve", style: .default, handler: { _  in
            let confirm = UIAlertController(title: "Confirmation", message: "Forced Operation", preferredStyle: .alert);
            confirm.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            self.present(confirm, animated: true, completion: {
                self.statusLabel.text = label;
            });
        });
        alert.addAction(approve);
        self.present(alert, animated: true, completion: nil);
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
