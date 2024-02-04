//
//  RegisterDevicePresenter.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 7/9/23.
//


import UIKit
import Foundation

protocol IRegisterEvent : AnyObject{
    func deviceUUIDs(data: Data?)
    func showError(showLoginError: String?)
}

class RegisterEventPresenter: IRESTful_RegisterEvent {
    
    weak var delegate: IRegisterEvent?
    let interactor = RegisterDeviceInteractor()
    
    func setRegisterEventPresenter(delegate: IRegisterEvent, uuid:String){
        self.delegate = delegate

        // UUID to be sent for login
        print("stored in sharePreferences: \(Storage.shared.storageGetDeviceUUID())")
        interactor.sendEventUUID(delegate: self, with: uuid)
    
    }
    
    func mockAPICall(delegate: IRegisterEvent){
        self.delegate = delegate
        print("mockAPICall")
        interactor.mockEventUUID(delegate: self)
    }
    
    func registerEventCallback(data: Data?) {
        do {
            print("registerEventCallback")
            self.delegate?.deviceUUIDs(data: data)
        }
    }
    
    func httpError(error: String?) {
        
        do {
            self.delegate?.showError(showLoginError: error)
        }
       
    }
}
