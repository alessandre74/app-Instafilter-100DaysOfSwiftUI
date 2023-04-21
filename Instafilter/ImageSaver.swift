//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Alessandre Livramento on 15/03/23.
//

import UIKit

class ImageSaver: NSObject {
    var successhandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?

    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successhandler?()
        }
    }
}
