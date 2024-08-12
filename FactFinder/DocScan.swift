//
//  DocScan.swift
//  TextReader
//
//  Created by Rafiq Rifhan Rosman on 2024/08/03.
//

import Foundation
import Vision
import VisionKit
import UIKit


class DocScan: ObservableObject{
    
    @Published var text = ""
    
    func processImage(image: UIImage) {
        
        guard let cgImage = image.cgImage
        else {
            print ("Failed to load image")
            return
        }
        
        // Create a text recognition request.
        let textRecognitionRequest = VNRecognizeTextRequest { request, error  in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            // Handle the result or error from text recognition.
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                print("Error: Text recognition failed.")
                return
            }
            
            for observation in observations {
                self.text += " \(observation.topCandidates(1).first?.string ?? "no text detected")"
               
            }
            
             print(self.text)

        }
        
        // Select recognition level
        textRecognitionRequest.recognitionLevel = .accurate
        
        // Set the revision
//        textRecognitionRequest.revision = VNCoreMLRequestRevision1
        
        // Control language correction
//        textRecognitionRequest.usesLanguageCorrection = true
        
        // Create Request Handler
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        
        // Send the request to the request handler
        do {
            try requestHandler.perform([textRecognitionRequest])
        } catch {
            print("Failed to perform VNReqeust: \(error.localizedDescription)")
        }
        
    }
    
}



