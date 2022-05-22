//
//  HomeViewController.swift
//  AmongUsExam
//
//  Created by iMac on 5/4/2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    //var
    var avatarName: String?
    
    
    var data = ["Hu5tl3r", "MC_Killer", "CR7", "Not_Impostor", "BabyShark", "AKINFENWA", "DR'Who"]
    var dataimage = ["Red", "Brown", "Orange", "Purple", "Rose", "Yellow", "Light-blue"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.contentView
        
        let imageView = contentView?.viewWithTag(1) as! UIImageView
        let label = contentView?.viewWithTag(2) as! UILabel
        let subLabel = contentView?.viewWithTag(3) as! UILabel
    
        
        label.text = data[indexPath.row]
        imageView.image = UIImage(named: dataimage[indexPath.row])
        subLabel.text = dataimage[indexPath.row]
        
        return cell!
    }
    
    //Cellule OnClickListener
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "secondSegue", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondSegue"{
            
            //j'ai besoin de récupérer sender
            let indexPath = sender as! IndexPath
            let destination = segue.destination as! DetailsViewController
            destination.playerNamee = data[indexPath.row]
            destination.playerImage = dataimage[indexPath.row]
        }
      
        
        
    }
    
   
    //widgets
    
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var homeViewTV: UITableView!
    
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = "Hello  " + avatarName!

        // Do any additional setup after loading the view.
    }
    
    
    //functions
    
    
    
    
    //ibActions
    
    @IBAction func emergencyMeetingAction(_ sender: Any) {
        performSegue(withIdentifier: "thirdSegue", sender: sender)
    }
    
}
