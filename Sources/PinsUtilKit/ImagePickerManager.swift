//
//  ImagePickerManager.swift
//  PinsUtilKit
//
//  Created by 주동석 on 12/31/23.
//

import UIKit
import UniformTypeIdentifiers

public enum ImagePickerManager {
    @MainActor
    public static func loadImageAsync(_ itemProvider: NSItemProvider) async -> UIImage? {
        return await withCheckedContinuation { continuation in
            itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                if var image = image as? UIImage {
                    image = image.resizeImage(width: 720)
                    continuation.resume(returning: image)
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    @MainActor
    public static func loadFileExtension(_ itemProvider: NSItemProvider) async -> String? {
        return await withCheckedContinuation { continuation in
            itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { url, _ in
                if let url = url {
                    let fileExtension = url.pathExtension
                    continuation.resume(returning: fileExtension)
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}

extension UIImage {
    func resizeImage(width: CGFloat) -> UIImage {
        let newSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))

        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        self.draw(in: CGRect(origin: .zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return resizedImage!
    }
}
