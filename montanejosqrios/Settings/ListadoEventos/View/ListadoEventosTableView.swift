//
//  ListadoEventosTableView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit

// MARK: - UI Setup
extension ListadoEventosViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsCell", for: indexPath) as! EventsTableViewCell
        
        let eventAssets: EventUUID
        eventAssets = events[indexPath.row]
        cell.uuid.text = eventAssets.eventuuid
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // This method is called when a row is selected
        let selectedItem = events[indexPath.row]
        
        
        
        
        
        
    }
    
    
}

