//
//  DatosEventosPresenter.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 28/11/23.
//

import UIKit
import Foundation

protocol IDatosEventos : AnyObject{
    func datosEvento(data: Data?)
    func showError(showError: String?)
}

class DatosEventosPresenter: IRESTful_DatosEventos {
    
    weak var delegate: IDatosEventos?
    let interactor = DatosEventosInteractor()
    
    func setDatosEventosPresenter(delegate: IDatosEventos, event_uuid: String){
        self.delegate = delegate
        interactor.getEventDataStatus(delegate: self, with: Storage.shared.storageGetDeviceUUID(), authToken: Storage.shared.storageGetEventUUID())
    }
    
    func mockAPICall(delegate: IDatosEventos){
        self.delegate = delegate

        // UUID to be sent for login
        print("stored in sharePreferences: \(Storage.shared.storageGetEventUUID())")
        interactor.mockCall(delegate: self)

    }
    
    func datosEventosCallback(data: Data?) {
        do {
            self.delegate?.datosEvento(data: data)
        }
    }
    
    func httpError(error: String?) {
        do {
            self.delegate?.showError(showError: error)
        }
    }
}

