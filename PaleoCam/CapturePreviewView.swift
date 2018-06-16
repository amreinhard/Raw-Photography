//
//  CapturePreviewView.swift
//  PaleoCam
//
//  Created by Amanda Reinhard on 6/14/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import UIKit
import AVFoundation

class CapturePreviewView: UIView {

    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
}
