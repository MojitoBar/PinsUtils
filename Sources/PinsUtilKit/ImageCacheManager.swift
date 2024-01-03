//
//  ImageCacheManager.swift
//  PinsUtilKit
//
//  Created by 주동석 on 12/31/23.
//

import UIKit

public final class ImageCacheManager {
    public static let shared = ImageCacheManager()
    private let cache = NSCache<NSString, UIImage>()

    private init() {}

    public func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    public func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}
