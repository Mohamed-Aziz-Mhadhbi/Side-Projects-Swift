//
//  ViewController.swift
//  AmongUsExam
//
//  Created by iMac on 4/4/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    //var
    

    
    
    //widgets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var avatarNameTF: UITextField!
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    //functions
    
    
    
    //ibActions
    
    @IBAction func StartAction(_ sender: Any) {
        performSegue(withIdentifier: "firstSegue", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue" {
        let destination = segue.destination as! HomeViewController
            destination.avatarName = avatarNameTF.text
        }
        
    }
    //..
    
    @IBAction func redBtnAction(_ sender: Any) {
        avatarImageView.image = UIImage(named: "Red")
    }
    //..
    
    @IBAction func yellowBtnAction(_ sender: Any) {
        avatarImageView.image = UIImage(named: "Yellow")
            
    }
    //..
    
    @IBAction func brownBtnAction(_ sender: Any) {
        avatarImageView.image = UIImage(named: "Brown")
    }
    //..
    
    @IBAction func blueBtnAction(_ sender: Any) {
        avatarImageView.image = UIImage(named: "Light-blue")
    }
    
    @IBAction func orangeBtnAction(_ sender: Any) {
        avatarImageView.image = UIImage(named: "Orange")
    }
    //..
    
    @IBAction func purpleBtnAction(_ sender: Any) {
        avatarImageView.image = UIImage(named: "Purple")
    }
    //..
    
    @IBAction func pinkBtnAction(_ sender: Any) {
        avatarImageView.image = UIImage(named: "Rose")
    }
}

