//
//  Storage.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 23/11/23.
//

import Foundation

/* Usage
 MySingleton.shared.storageSaveUUID()
 and so on....
 */


class Storage {
    
    static let shared = Storage()
    
    // Private initializer to prevent creating instances outside of this class.
      private init() {}
    
    func storageSaveEventUUID (eventUUID: String){
        ///save the name for the merger:
        let savedValue = UserDefaults.standard
        savedValue.set(eventUUID, forKey: "event_uuid")
        savedValue.synchronize()
    }
    
    func storageGetEventUUID() -> String{
        ///save the name for the merger:
        if let getValue = UserDefaults.standard.string(forKey: "event_uuid") {
            return getValue
        }
        
        return ""
    }
    
    func storageDeviceSaveRegistered (registered: Bool){
        ///save the name for the merger:
        let savedValue = UserDefaults.standard
        savedValue.set(registered, forKey: "device_registered")
        savedValue.synchronize()
    }
    
    func storageDeviceGetRegistered() -> Bool?{
        ///save the name for the merger:
        if let getValue = UserDefaults.standard.value(forKey: "device_registered") as? Bool {
            return getValue
        }
        
        return false
    }
    
    
    func storageSaveTestMode (testMode: Bool){
        ///save the name for the merger:
        let savedValue = UserDefaults.standard
        savedValue.set(testMode, forKey: "test_mode")
        savedValue.synchronize()
    }
    
    func storageGetTestMode() -> Bool{
        ///save the name for the merger:
        if let getValue = UserDefaults.standard.value(forKey: "test_mode") as? Bool {
            return getValue
        }
        
        return false
    }
    
    /*
     eventName = "Visita Fuente Ba\U00f1os";
     location = "<null>";
     name = "Entrada principal";
     phone = "<null>";
     uuid = "745c5bee-1a4b-33b9-91b9-a43d26ab2f44";
     */
    
    func storageSaveQRButtonEvent (qrEvent: String){
        ///save the name for the merger:
        let savedValue = UserDefaults.standard
        savedValue.set(qrEvent, forKey: "qr_button_event")
        savedValue.synchronize()
    }
    
    func storageGetQRButtonEvent() -> String{
        ///save the name for the merger:
        if let getValue = UserDefaults.standard.string(forKey: "qr_button_event") {
            return getValue
        }
        
        return ""
    }
    
    func storageSaveEventName (eventUUID: String){
        ///save the name for the merger:
        let savedValue = UserDefaults.standard
        savedValue.set(eventUUID, forKey: "event_name")
        savedValue.synchronize()
    }
    
    func storageGetEventName() -> String{
        ///save the name for the merger:
        if let getValue = UserDefaults.standard.string(forKey: "event_name") {
            return getValue
        }
        
        return ""
    }
    
    func storageSaveEventEventName (eventUUID: String){
        ///save the name for the merger:
        let savedValue = UserDefaults.standard
        savedValue.set(eventUUID, forKey: "event_event_name")
        savedValue.synchronize()
    }
    
    func storageGetEventEventName() -> String{
        ///save the name for the merger:
        if let getValue = UserDefaults.standard.string(forKey: "event_event_name") {
            return getValue
        }
        
        return ""
    }
    
    //changed to from event to device
    func storageSaveDeviceUUID (deviceUUID: String){
        ///save the name for the merger:
        let savedValue = UserDefaults.standard
        savedValue.set(deviceUUID, forKey: "device_uuid")
        savedValue.synchronize()
    }
    
    func storageGetDeviceUUID() -> String{
        ///save the name for the merger:
        if let getValue = UserDefaults.standard.string(forKey: "device_uuid") {
            return getValue
        }
        
        return ""
    }
    
}


