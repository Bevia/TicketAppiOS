//
//  RegisterDeviceInteractor.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 14/9/23.
//

import UIKit
import Foundation

protocol IRESTful_RegisterEvent : AnyObject{
    func registerEventCallback(data : Data?)
    func httpError(error: String?)
}

class RegisterDeviceInteractor {
    
    func sendEventUUID(delegate : IRESTful_RegisterEvent, with uuid: String) {
        // Create the URL
        let urlString = "https://bo.tiketea.net/api/event/\(uuid)/devices"
        
        print("urlString: \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        // Create the URLSession
        let session = URLSession.shared

        // Create the data task
        let task = session.dataTask(with: url) { (data, response, error) in
            // Check for errors
            if let error = error {
                print("Error: \(error)")
                return
            }

            // Check if there is data
            guard let data = data else {
                print("No data received")
                return
            }

            // Parse the data (if needed)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("json: \(json)")
                // Handle the JSON response here, pass it to presenter....
                
                delegate.registerEventCallback(data: data)
                
                
            } catch {
                print("Error parsing JSON: \(error)")
                delegate.httpError(error: error.localizedDescription)
            }
        }

        task.resume()
    }
    
    func mockEventUUID(delegate : IRESTful_RegisterEvent){
        let jsonString = """
        {
            "items": [
                {
                    "uuid": "1fae8d0e-1a20-37b0-a095-0b759ad42106",
                    "name": "Barra",
                    "phone": null,
                    "location": null,
                    "eventName": "Visita Fuente Baños"
                },
                {
                    "uuid": "745c5bee-1a4b-33b9-91b9-a43d26ab2f44",
                    "name": "Entrada principal",
                    "phone": null,
                    "location": null,
                    "eventName": "Visita Fuente Baños"
                }
            ]
        }
        """
        
        // Convert the JSON string to Data
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                print("mockEventUUID")
                delegate.registerEventCallback(data: jsonData)
                
            }
        }
    }
}
