//
//  DatosEventosInteractor.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 28/11/23.
//

import UIKit

protocol IRESTful_DatosEventos : AnyObject{
    func datosEventosCallback(data : Data?)
    func httpError(error: String?)
}

class DatosEventosInteractor {
    
    func getEventDataStatus(delegate: IRESTful_DatosEventos, with event_uuid: String, authToken: String) {
        // Create the URL
        let urlString = "https://bo.tiketea.net/api/event/\(event_uuid)/status"
        
        print("urlString: \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        // Create the URLSession
        let session = URLSession.shared
        
        // Create the URLRequest and add the header
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(authToken, forHTTPHeaderField: "X-Auth-Token")
        
        // Create the data task
        let task = session.dataTask(with: request) { (data, response, error) in
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
                
                delegate.datosEventosCallback(data: data)
                
            } catch {
                print("Error parsing JSON: \(error)")
                delegate.httpError(error: error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    func mockCall(delegate : IRESTful_DatosEventos){
        
        let jsonString = """
        {
            "people": {
                "in_global": 2209,
                "in_today": 1,
                "out_global": 1,
                "out_today": 1
            },
            "event_capacity": {
                "current": 49,
                "limit": 50,
                "temperature": "green"
            }
        }
        """
        
        // Convert the JSON string to Data
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                delegate.datosEventosCallback(data: jsonData)
                
            }
        }
    }
}
