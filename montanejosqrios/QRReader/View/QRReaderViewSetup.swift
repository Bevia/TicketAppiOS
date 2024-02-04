//
//  QRReaderViewSetup.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 26/10/23.
//

import UIKit
import AVFoundation

// MARK: - UI Setup
extension QRReaderView: AVCaptureMetadataOutputObjectsDelegate{
    
    func setupQRReaderView() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        //let size = CGSize(width: self.frame.width, height: .infinity)
        
        self.backgroundColor = Colors.white.getColor
        
        //let size = CGSize(width: self.frame.width, height: .infinity)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width * 0.97
        let textFieldsWidth = screenSize.width * 0.80
        
        self.addSubview(registeredLabel)
        self.addSubview(montanejosImage)
       
        self.addSubview(qrParentView)

        self.addSubview(scannedQRCodeLabel)
        self.addSubview(backImage)
    
        montanejosImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        let image = UIImage(named: "montanejos")
        if let imageSize = image?.size {
            // Now you have the width and height of the image in the 'imageSize' variable.
            let imageWidth = imageSize.width
            let imageHeight = imageSize.height
            
            // print("imageWidth: \(imageWidth)")
            // print("imageHeight: \(imageHeight)")
            
            montanejosImage.anchor(
                top: self.safeAreaLayoutGuide.topAnchor,
                leading: nil,
                bottom: nil,
                trailing: nil,
                padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                size: CGSize(width: imageWidth + 80 , height: imageHeight + 50))
        } else {
            // Handle the case where the image couldn't be loaded or its width couldn't be determined.
            montanejosImage.anchor(
                top: registeredLabel.bottomAnchor,
                leading: nil,
                bottom: nil,
                trailing: nil,
                padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                size: CGSize(width: 220, height: 153))
            
        }
        
        registeredLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        registeredLabel.anchor(
            top: montanejosImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: screenWidth, height: 50))
        
        /*
         QR Code view
         */
        
        qrParentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        qrParentView.anchor(
            top: registeredLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 340, height: 340))
        
        //videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        //videoPreviewLayer.frame = CGRect(x:0, y:0, width: 340, height: 340)
        
        qrCodeFrameView = UIView(frame: CGRect(x:0, y:0, width: 340, height: 340))
        qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
        qrCodeFrameView.layer.borderWidth = 2
        
        scannedQRCodeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scannedQRCodeLabel.anchor(
            top: qrParentView.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0),
            size: CGSize(width: 340, height: 50))
    
        backImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backImage.anchor(
            top: nil,
            leading: nil,
            bottom: self.safeAreaLayoutGuide.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0),
            size: CGSize(width: 80, height: 40))
        
        
    }
}
