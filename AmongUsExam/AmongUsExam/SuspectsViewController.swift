//
//  SuspectsViewController.swift
//  AmongUsExam
//
//  Created by iMac on 5/4/2022.
//

import UIKit
import CoreData

class SuspectsViewController: UIViewController,UICollectionViewDataSource  {
    
    //var
    
    var suspects = [String]()
    @IBOutlet weak var suspectsCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suspects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mCell", for: indexPath)

        let contentView = cell.contentView


        let label = contentView.viewWithTag(2) as! UILabel
        let imageView = contentView.viewWithTag(1) as! UIImageView

            
                label.text = suspects[indexPath.row]
                imageView.image = UIImage(named: suspects[indexPath.row])


        return cell
    }
    
    //widgets
    
    
    
    
    //lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetching
        fetchData()
        //suspectsCV.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    //functions
    
    func fetchData() {
        
        //3 etapes primandiaux au CRUD
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext //[NSManagedObject]
        
        
        let request = NSFetchRequest<NSManagedObject>(entityName:"Player")
        
        do {
            let result = try managedContext.fetch(request)
            for item in result{
                suspects.append(item.value(forKey: "playerName") as! String)}
                //suspectsCV.reloadData()
            
        } catch {
            print("FETCHING ERROR")
        }
        
    }
    
    
    
    //ibActions
    

    

}
