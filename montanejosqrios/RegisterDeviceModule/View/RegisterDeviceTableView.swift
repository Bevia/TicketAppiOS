//
//  RegisterDeviceTableView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 23/11/23.
//

import UIKit

// MARK: - UI Setup
extension RegisterDeviceViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(selectTableCell == "device"){
            return items.count
        }
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath) as! DeviceTableViewCell
        
        print("selectTableCell: \(selectTableCell)")
       
        if(selectTableCell == "device"){
            
            let item = items[indexPath.row]
          
            // Customize the cell as needed
            cell.nameLabel.text = item.name
            cell.eventNameLabel.text = item.eventName
            cell.uuid.text = item.uuid
            
            return cell
            
        }else if (selectTableCell == "event"){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventsCell", for: indexPath) as! EventsTableViewCell
         
            let eventAssets: EventUUID
            eventAssets = events[indexPath.row]
            cell.uuid.text = eventAssets.eventuuid
            
            return cell
        }
    
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // This method is called when a row is selected
        
        if(selectTableCell == "device"){
            
            // Get the selected item
            let selectedItem = items[indexPath.row]
            
            Storage.shared.storageSaveEventName(eventUUID: selectedItem.name)
            Storage.shared.storageSaveEventEventName(eventUUID: selectedItem.eventName)
            Storage.shared.storageSaveEventUUID(eventUUID: selectedItem.uuid)
            
            Storage.shared.storageDeviceSaveRegistered(registered: true)
            Storage.shared.storageSaveTestMode(testMode: true)
            
            DispatchQueue.main.async {
                self.mainView?.registerButton.isHidden = false
                self.mainView?.selectEventButton.isHidden = false
                self.mainView?.messageLabel.isHidden = false
                self.mainView?.registrationEditText.isHidden = false
                self.mainView?.tableView.isHidden = true
                self.mainView?.backImage.isHidden = true
            }
            
            //Go to mainclass now...
            self.mainRouter?.routeToMainView(navigationController: navigationController!)
            
        }else if (selectTableCell == "event"){
            
            let selectedItem = events[indexPath.row]
            
            self.mainView?.registrationEditText.text = selectedItem.eventuuid
            
            DispatchQueue.main.async {
                self.mainView?.registerButton.isHidden = false
                self.mainView?.selectEventButton.isHidden = false
                self.mainView?.messageLabel.isHidden = false
                self.mainView?.registrationEditText.isHidden = false
                self.mainView?.tableView.isHidden = true
                self.mainView?.backImage.isHidden = true
            }
        }
    }
}
