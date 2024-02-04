//
//  HistorialTableView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit

// MARK: - UI Setup
extension HistorialViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QRHistoryTableViewCell", for: indexPath) as! QRHistoryTableViewCell
        
        let qrDataAssets: QRHistory
        qrDataAssets = qrData[indexPath.row]
        cell.title.text = qrDataAssets.title
        cell.date.text = "fecha: " + qrDataAssets.date!
        cell.concept.text = "concepto: " + qrDataAssets.concept!
        cell.state.text = "estado: " + qrDataAssets.state!
        cell.event_uuid.text = "evento: " + qrDataAssets.event_uuid!
        cell.uuid.text = "dispositivo: " + qrDataAssets.uuid!
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // This method is called when a row is selected
        let selectedItem = qrData[indexPath.row]
        
        
        
    
    }
    
    
}

