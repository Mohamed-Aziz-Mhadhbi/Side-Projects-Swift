//
//  MessagesViewController.swift
//  Messagerie
//
//  Created by iMac on 5/4/2022.
//

import UIKit
import CoreData

class MessagesViewController: UIViewController {
    
    //var
    
    var name:String?
    var message:String?
    var imageuser:String?
    
    
    //widgets
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    //life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        userImageView.image = UIImage(named: imageuser!)
        messageLabel.text = message!
        userNameLabel.text = name!
        // Do any additional setup after loading the view.
    }
    
    
    //functions
    
    func insertItem() {
        //3 etapes primandiaux au CRUD
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext //[NSManagedObject]
        
        
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Messanger", in: managedContext)
        let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
        object.setValue(name!, forKey: "userName")
        object.setValue(message!, forKey: "chatMessage")
        object.setValue(imageuser!, forKey: "imageUtilisateur")
        
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
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Messanger")
        let predicate = NSPredicate(format: "userName = %@", name!)
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
    
    //ibactions
    
    
    @IBAction func sendAction(_ sender: Any) {
    }
    
    @IBAction func favoritesAction(_ sender: Any) {
        if checkPlayer() {
            let alert = UIAlertController(title: "Message", message: "User already exist", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Message", message: "User saved succefully!", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        insertItem()
        }
        
    }
    
}
