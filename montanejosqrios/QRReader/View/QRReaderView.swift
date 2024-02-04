//
//  QRReaderView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 26/10/23.
//


import UIKit
import AVFoundation

class QRReaderView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("setupMainUI")
        setupQRReaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Items
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    /// ****************************************************************************
    
    
    lazy var registeredLabel: UILabel = {
        let center_label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 22,
                numberOfLines: 0)
        
        return center_label
    }()
    
    lazy var montanejosImage: UIImageView = {
        let imageView = UIImageView()
        let catImage = UIImage(named: "montanejos")
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.image = catImage
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    /*
     QR UI
     */
    
    
    lazy var qrParentView: UIView = {
        let qrParentCaptureView = UIView()
        return qrParentCaptureView
    }()
    
    lazy var qrCodeFrameView: UIView = {
        let qrCodeFrame = UIView()
        return qrCodeFrame
    }()
    
    lazy var videoPreviewLayer: AVCaptureVideoPreviewLayer = {
        let videoPreview_Layer = AVCaptureVideoPreviewLayer()
        return videoPreview_Layer
    }()
    
    lazy var scannedQRCodeLabel: UILabel = {
        let scannedQRCode_Label =
            CustomLabel.init().customLabelAlignmentCenter(
                labelString: "",
                color: ButtonsBackgroundTintColor.registro_dispositivo_textview.getColor,
                font: UIFont(name: "Helvetica Neue", size: 0)!,
                size: 22,
                numberOfLines: 0)
        
        return scannedQRCode_Label
    }()
  
    /*
   
    
     
     */
    
    
    /*
     
     */
    
    lazy var backImage: UIImageView = {
        let theDotImageView = UIImageView()  //you need to make this clickable...
        theDotImageView.image = UIImage(named: "arrow_light_left.png")
        theDotImageView.frame = CGRect(x: 0, y: 0, width:80, height: 40)
        return theDotImageView
        
    }()
    
  
}
