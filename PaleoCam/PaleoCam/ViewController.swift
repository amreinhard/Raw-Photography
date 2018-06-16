//
//  ViewController.swift
//  PaleoCam
//
//  Created by Amanda Reinhard on 6/14/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    let session = AVCaptureSession()
    let photoOutput = AVCapturePhotoOutput()
    var capturePreview: CapturePreviewView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        capturePreview = CapturePreviewView()
        capturePreview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(capturePreview)
        
        capturePreview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        capturePreview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        capturePreview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        capturePreview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        (capturePreview.layer as! AVCaptureVideoPreviewLayer).session = session
        
        let takePhoto = UIButton(type: .custom)
        takePhoto.translatesAutoresizingMaskIntoConstraints = false
        takePhoto.setTitle("Take Photo", for: [])
        takePhoto.setTitleColor(UIColor.red, for: [])
        view.addSubview(takePhoto)
        
        takePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        takePhoto.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        takePhoto.addTarget(self, action: #selector(capturePhoto), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureSession() -> Bool {
        session.beginConfiguration()
        
        session.sessionPreset = AVCaptureSession.Preset.photo
        
        do {
            let videoCaptureDevice = AVCaptureDevice.default(for: .video)
            
            let videoDeviceInput = try AVCaptureDeviceInput(device: videoCaptureDevice!)
            
            if session.canAddInput(videoDeviceInput){
                session.addInput(videoDeviceInput)
            } else {
                print("Failed to add video device input.")
                session.commitConfiguration()
                return false
            }
            if session.canAddOutput(photoOutput) {
                session.addOutput(photoOutput)
                photoOutput.isHighResolutionCaptureEnabled = true
            } else {
                print("Failed to add photo output.")
                session.commitConfiguration()
                return false
            }
        } catch {
            print("Failed to create device input: \(error)")
            session.commitConfiguration()
            return false
        }
        
        session.commitConfiguration()
        session.startRunning()
        return true
    }

    @objc func capturePhoto() {
        guard let rawFormat = photoOutput.supportedRawPhotoPixelFormatTypes(for: .dng).first else { return }
        let photoSettings = AVCapturePhotoSettings(rawPixelFormatType: rawFormat.uint32Value)
        
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = .auto
        
        photoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        let data = photo.fileDataRepresentation()
    }

}

