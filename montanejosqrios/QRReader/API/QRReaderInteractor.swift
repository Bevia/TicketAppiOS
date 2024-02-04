//
//  QRReaderInteractor.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit
import Foundation

protocol IRESTful_QRReader : AnyObject{
    func registerQRDataCallback(data : Data?)
    func httpError(error: String?)
}

class QRReaderInteractor {
    
    private var urlString: String = ""
    
    func sendQRTicketData(delegate: IRESTful_QRReader, with ticket_uuid: String, with state: String, authToken: String) {
        // Create the URL
        
        if(state == "checkin"){
            urlString = "https://bo.tiketea.net/api/checkin/\(ticket_uuid)"
        }else  if(state == "checkin"){
            urlString = "https://bo.tiketea.net/api/checkout/\(ticket_uuid)"
        }else{
            urlString = ""
        }
        
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
        request.setValue(authToken, forHTTPHeaderField: "X-Auth-Token")  //THIS IS THE EVENT TOKEN (from initial registration)
        
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
                
                delegate.registerQRDataCallback(data: data)
                
            } catch {
                print("Error parsing JSON: \(error)")
                delegate.httpError(error: error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    func mockQRCheckIn(delegate : IRESTful_QRReader){
        let jsonString = """
        {
           "uuid":"4996e7c3-8e3e-3e13-89df-ea2879224c1e",
           "title":"Visita Fuente Baños",
           "event_uuid":"6b6d2c29-c54e-3186-8c0e-ad57ef275012",
           "concept":"Entrada gratis",
           "current_usages":1,
           "available_usages":0,
           "max_usages":1,
           "ignore_quota":false,
           "allow_admission":true,
           "state":"IN"
        }
        """
        
        // Convert the JSON string to Data
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                print("mockEventUUID")
                delegate.registerQRDataCallback(data: jsonData)
                
            }
        }
    }
    
    func mockQRCheckOut(delegate : IRESTful_QRReader){
        let jsonString = """
        {
           "uuid":"4996e7c3-8e3e-3e13-89df-ea2879224c1e",
           "title":"Visita Fuente Baños",
           "event_uuid":"6b6d2c29-c54e-3186-8c0e-ad57ef275012",
           "concept":"Entrada gratis",
           "current_usages":1,
           "available_usages":0,
           "max_usages":1,
           "ignore_quota":false,
           "allow_admission":true,
           "state":"OUT"
        }
        """
        
        // Convert the JSON string to Data
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                print("mockEventUUID")
                delegate.registerQRDataCallback(data: jsonData)
                
            }
        }
    }
}
