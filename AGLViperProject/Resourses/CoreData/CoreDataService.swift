//
//  CoreDataService.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 11.11.2020.
//

import UIKit
import CoreData

class CoreDataService {
    
    static let shared: CoreDataService = CoreDataService()
    
    //MARK: - Главное меню
    func saveHomeScreenDataInCoreData(_ homeScreenDataEntity: [HomeScreenData]?, completion: @escaping ([HomeScreenCoreData]?) -> Void) {
        DispatchQueue.main.async {
            guard let homeDataObjects = homeScreenDataEntity, let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            guard let entity = NSEntityDescription.entity(forEntityName: "HomeScreenCoreData", in: context) else { return }
            var taskObjects: [HomeScreenCoreData] = []
            for homeData in homeDataObjects {
                let task = NSManagedObject(entity: entity, insertInto: context) as! HomeScreenCoreData
                
                task.title = homeData.title
                task.details = homeData.details
                task.imageName = homeData.imageName
                task.price = homeData.price
                task.priceText = homeData.priceText
                task.header = homeData.header
                task.footer = homeData.footer
                task.count = homeData.count ?? 0
                
                taskObjects.append(task)
            }
            appDelegate.saveContext()
            completion(taskObjects)
        }
    }
    
    func fetchHomeScreenDataFromCoreData() -> [HomeScreenData]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext
        var taskObjects: [HomeScreenData] = []
        do {
            let fetchRequest : NSFetchRequest<HomeScreenCoreData> = HomeScreenCoreData.fetchRequest()
            let fetchedResults = try context.fetch(fetchRequest)
            for task in fetchedResults {
                let object = HomeScreenData(title: task.title ?? "", details: task.details ?? "", imageName: task.imageName ?? "", price: task.price, priceText: task.priceText ?? "", header: task.header, footer: task.footer, count: task.count)
                
                taskObjects.append(object)
            }
            return taskObjects
        }
        catch {
            print ("Fetch task failed: \(error.localizedDescription)")
        }
        return taskObjects
    }
    
    //MARK: - Корзина
    func saveBasketDataInCoreData(_ basketDataEntity: [BasketData]?, completion: @escaping ([BasketCoreData]?) -> Void) {
        DispatchQueue.main.async {
            guard let basketObjects = basketDataEntity, let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            guard let entity = NSEntityDescription.entity(forEntityName: "BasketCoreData", in: context) else { return }
            var taskObjects: [BasketCoreData] = []
            for basket in basketObjects {
                let task = NSManagedObject(entity: entity, insertInto: context) as! BasketCoreData
                
                task.price = basket.price
                task.title = basket.title
                task.imageName = basket.imageName
                task.details = basket.details
                task.count = basket.count
                
                taskObjects.append(task)
            }
            appDelegate.saveContext()
            completion(taskObjects)
        }
    }
    
    func fetchBasketDataFromCoreData() -> [BasketData]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext
        var taskObjects: [BasketData] = []
        do {
            let fetchRequest: NSFetchRequest<BasketCoreData> = BasketCoreData.fetchRequest()
            let fetchedResults = try context.fetch(fetchRequest)
            for task in fetchedResults {
                let object = BasketData(price: task.price, title: task.title, imageName: task.imageName, details: task.details, count: task.count)
                
                taskObjects.append(object)
            }
            return taskObjects
        }
        catch {
            print ("Fetch task failed: \(error.localizedDescription)")
        }
        return taskObjects
    }
}
