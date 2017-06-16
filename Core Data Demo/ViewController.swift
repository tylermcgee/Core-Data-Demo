//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Tyler McGee on 6/9/17.
//  Copyright © 2017 Tyler McGee. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        /*
        
        newUser.setValue("tommy", forKey: "username")
        newUser.setValue("mypass", forKey: "password")
        newUser.setValue(5, forKey: "age")
        
        do {
            
            try context.save()
            
            print("saved")
            
            
        } catch {
            
            print("there was an error")
            
        }
 
 */
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //request.predicate = NSPredicate(format: "username = %@", "ralphie")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                       
                        /*
                        
                       context.delete(result)
                        
                        do {
                            
                            try context.save()
                            
                            
                        } catch {
                            
                            print("delete failed")
                            
                        }
                        
                        
                        
                        result.setValue("Dooley", forKey: "username")
                        
                        do {
                            
                            try context.save()
                            
                            
                        } catch {
                            
                            print("rename failed")
                            
                        }
 
 */
                        
                        print(username)
                        
                    }
                    
                }
                
            } else {
                
                print("no results")
            }
            
            
        } catch {
            
            print("couldn't fetch results")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

