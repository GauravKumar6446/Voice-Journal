//
//  DataBase.swift
//  Voice Journal
//
//  Created by Gaurav Kumar on 02/10/25.
//

import Foundation
import CoreData
import UIKit

class DataBaseHelper {
    
    static var shareInstance = DataBaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(textTitle : String, text : String, time : String) {
        
        let list = NSEntityDescription.insertNewObject(forEntityName: "Voices", into: context!)  as! Voices
        list.title = textTitle
        list.journal = text
        list.time = time
        
        
        do {
            try context?.save()
        }catch {
            print("data not save")
        }
    }
    
    func getList() -> [Voices] {
        var list = [Voices]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Voices")
        
        do {
            list = try context?.fetch(fetchRequest) as! [Voices]
            
        }
        catch {
            print("Can not get data")
        }
        
        return list
        
    }
    
    
    func deleteJournal(at : Int) {
        var list = getList()
        context?.delete(list[at])
        list.remove(at: at)
        
        do {
            try context?.save()
        }catch {
            print("Data not deleted")
        }
        
    }
    
    
}

