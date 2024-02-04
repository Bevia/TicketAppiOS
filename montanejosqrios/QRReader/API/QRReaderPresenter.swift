//
//  QRReaderPresenter.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit
import Foundation

protocol IDatosQR : AnyObject{
    func datosQR(data: Data?)
    func showError(showError: String?)
}

class QRReaderPresenter: IRESTful_QRReader {
    
    weak var delegate: IDatosQR?
    let interactor = QRReaderInteractor()
    
    func setDatosQRPresenter(delegate: IDatosQR, ticket_uuid: String, state: String, authToken: String ){
        self.delegate = delegate
        interactor.sendQRTicketData(delegate: self, with: ticket_uuid, with: state, authToken: Storage.shared.storageGetEventUUID())
    }
    
    func mockCheckInAPICall(delegate: IDatosQR){
        self.delegate = delegate
        interactor.mockQRCheckIn(delegate: self)
        
    }
    
    func mockCheckOutAPICall(delegate: IDatosQR){
        self.delegate = delegate
        interactor.mockQRCheckOut(delegate: self)
        
    }
    
    
    func registerQRDataCallback(data: Data?) {
        do {
            self.delegate?.datosQR(data: data)
        }
    }
    
    func httpError(error: String?) {
        do {
            self.delegate?.showError(showError: error)
        }
    }
}
