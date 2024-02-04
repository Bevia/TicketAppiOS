//
//  DataBaseHooks.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 23/11/23.
//
import UIKit
import CoreData

class DataBaseHooks {
    static let shared = DataBaseHooks() // Optional: You can use a singleton pattern if needed
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init() {}
    
}
