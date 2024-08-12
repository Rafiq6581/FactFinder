//
//  CameraViewModel.swift
//  FactFinder
//
//  Created by Rafiq Rifhan Rosman on 2024/08/04.
//

import AVFoundation
import UIKit

class CameraViewModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    private var session: AVCaptureSession
    private var photoOutput: AVCapturePhotoOutput
    private var previewLayer: AVCaptureVideoPreviewLayer
    @Published var capturedImage: UIImage?
    
    override init() {
        self.session = AVCaptureSession()
        self.photoOutput = AVCapturePhotoOutput()
        self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
        
        super.init()
        
        configureSession()
    }
    
    private func configureSession() {
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            return
        }
        
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {
            return
        }
        
        if session.canAddInput(videoDeviceInput) {
            session.addInput(videoDeviceInput)
        }
        
        if session.canAddOutput(photoOutput) {
            session.addOutput(photoOutput)
        }
        
        session.startRunning()
    }
    
    func getPreviewLayer() -> AVCaptureVideoPreviewLayer {
        return previewLayer
    }
    
    func capturePhoto() {
        let photoSettings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let photoData = photo.fileDataRepresentation() else {
            return
        }
        capturedImage = UIImage(data: photoData)
    }
}
