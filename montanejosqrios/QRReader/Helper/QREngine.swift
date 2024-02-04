//
//  QREngine.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 22/11/23.
//

import UIKit
import AVFoundation

// MARK: - UI Setup
extension QRReaderViewController{
    
    // AVCaptureMetadataOutputObjectsDelegate method to handle detected metadata (QR codes)
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        // Check if a QR code has already been read
        guard !qrCodeRead else {
            return
        }
        
        if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            if let qrCodeValue = metadataObject.stringValue {
                // Display the scanned QR code value in the label
                mainView?.scannedQRCodeLabel.text = qrCodeValue
                
                // Set the flag to true to indicate that a QR code has been read
                qrCodeRead = true
                
                // Highlight the QR code with a green border
                if let objectRect = mainView?.videoPreviewLayer.transformedMetadataObject(for: metadataObject)?.bounds {
                    mainView?.qrCodeFrameView.frame = objectRect
                }
                
                // Trigger the feedback generator, vibrate phone
                self.feedbackGenerator.impactOccurred()
                
                DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
                    // Reset the flag after 3 seconds to allow processing another QR code
                    self.qrCodeRead = false
                }
                
                // Further processing can be added here if needed
                if(Storage.shared.storageGetQRButtonEvent() == "enter"){
                    qRReaderPresenter.mockCheckInAPICall(delegate: self)
                }
                
                if(Storage.shared.storageGetQRButtonEvent() == "exit"){
                    qRReaderPresenter.mockCheckOutAPICall(delegate: self)
                }
            }
        }
    }
}
