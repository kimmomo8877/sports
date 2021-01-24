//
//  ActivityDataManager.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/23.
//

import Foundation
import CoreData

class ActivityDataManager {
    static let shared: ActivityDataManager = ActivityDataManager()
    
    let modelName: String = "Activity"
    let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    func getActivities() -> [Activity] {
        var models: [Activity] = [Activity]()
        
        if let context = context {
            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: modelName)
            
            do {
                if let fetchResult: [Activity] = try context.fetch(fetchRequest) as? [Activity] {
                    models = fetchResult
                }
            } catch let error as NSError {
                print("Could not fetch : \(error)")
            }
        }
        
        return models
    }
    
    func saveUser(timestamp: Date, walk: Int, walkTime: Int, walkDistance: Int, walkCalories: Int,
                  onSuccess: @escaping ((Bool) -> Void)) {
        if let context = context,
           let entity: NSEntityDescription = NSEntityDescription.entity(forEntityName: modelName, in: context) {
            
            if let activity: Activity = NSManagedObject(entity: entity, insertInto: context) as? Activity {
                activity.timestamp = timestamp
                activity.walk = Int16(walk)
                activity.walkTime = Int16(walkTime)
                activity.walkDistance = Int16(walkDistance)
                activity.walkCalories = Int16(walkCalories)
                contextSave { success in
                    onSuccess(success)
                }
            }
        }
    }
}

extension ActivityDataManager {
    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
        do {
            try context?.save()
            onSuccess(true)
        } catch let error as NSError {
            print("Could not save: \(error)")
            onSuccess(false)
        }
    }
}
