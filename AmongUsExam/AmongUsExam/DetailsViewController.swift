//
//  DetailsViewController.swift
//  AmongUsExam
//
//  Created by iMac on 5/4/2022.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {
    
    //var
    var playerNamee:String?
    var playerImage:String?
    
    //widgets
    
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    
    
    
    
    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerImageView.image = UIImage(named: playerImage!)
        playerNameLabel.text = playerNamee!
        

    }
    
    
    
    
    
    
    //functions

    func insertItem() {
        //3 etapes primandiaux au CRUD
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext //[NSManagedObject]
        
        
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Player", in: managedContext)
        let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
        object.setValue(playerNamee, forKey: "playerName")
        
        do {
            try managedContext.save()
            print("INSERT SUCCESSUFULLY")
        } catch  {
            print("INSERT ERROR")
        }
        
    }
    
    //check if the movie name exist already in the list
    func checkPlayer() -> Bool {
        var playerExist = false
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext //[NSManagedObject]
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Player")
        let predicate = NSPredicate(format: "playerName = %@", playerNamee!)
        request.predicate = predicate
        
        do {
           let result =  try managedContext.fetch(request)
            
            if result.count > 0 {
                playerExist = true
            }
        } catch  {
            print("FETCHING ERROR")
        }
        
        return playerExist
    }
    
    //ibActions
    
    @IBAction func savePlayer(_ sender: Any) {
        
        if checkPlayer() {
            let alert = UIAlertController(title: "Message", message: "Player already marked as suspect", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Message", message: "Player marked as suspect succefully!", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        insertItem()
        }
    }
    
}
