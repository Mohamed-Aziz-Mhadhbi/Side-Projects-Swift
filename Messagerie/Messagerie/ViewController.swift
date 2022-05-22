//
//  ViewController.swift
//  Messagerie
//
//  Created by iMac on 5/4/2022.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var Favorites = [String]()
    var data = ["Andreas Romero", "Chelsea Watt", "Huw Oakley", "Logan Calhoun", "Marcos Redmond", "Stanley Obrien"]
    var messages = ["meeting","hello","whats'up","Thank you","Bonjour","done","ok bro"]
    //var
    
    
    //widgets
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var myTableView: UITableView!
    
//life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        myTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    //functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var returnValue = 0
        
        switch(mySegmentedControl.selectedSegmentIndex){
        case 0:
            returnValue = data.count
            break
        case 1:
            returnValue = Favorites.count
            break
        default:
            break
        }
        
        return returnValue
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.contentView
        
        let imageView = contentView?.viewWithTag(1) as! UIImageView
        let label = contentView?.viewWithTag(2) as! UILabel
        let subLabel = contentView?.viewWithTag(3) as! UILabel
    
        
        label.text = data[indexPath.row]
        imageView.image = UIImage(named: data[indexPath.row])
        subLabel.text = messages[indexPath.row]
        
        return cell!
        
    }
    //cellule onclicklistener
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "firstSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue"{
            let indexPath = sender as! IndexPath
            let destination = segue.destination as! MessagesViewController
            destination.message = messages[indexPath.row]
            destination.imageuser = data[indexPath.row]
            destination.name = data[indexPath.row]
        }
    }
    
    func fetchData() {
        
        //3 etapes primandiaux au CRUD
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext //[NSManagedObject]
        
        
        let request = NSFetchRequest<NSManagedObject>(entityName:"Messanger")
        
        do {
            let result = try managedContext.fetch(request)
            for item in result{
                Favorites.append(item.value(forKey: "userName") as! String)}
                myTableView.reloadData()
            
        } catch {
            print("FETCHING ERROR")
        }
        
    }
    
    //ibactions
    

    @IBAction func segmentedControlAction(_ sender: Any) {
        
        myTableView.reloadData()
    }
    //..
    
    
}

