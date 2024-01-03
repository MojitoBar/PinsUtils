//
//  UIScreenUtils.swift
//  PinsUtilKit
//
//  Created by 주동석 on 12/31/23.
//

import UIKit

public enum UIScreenUtils {
    public static func getScreenWidth() -> CGFloat {
        return getActiveWindow()?.bounds.width ?? UIScreen.main.bounds.width
    }
    
    public static func getScreenHeight() -> CGFloat {
        return getActiveWindow()?.bounds.height ?? UIScreen.main.bounds.height
    }
    
    public static func getScreenSize() -> CGSize {
        return getActiveWindow()?.bounds.size ?? UIScreen.main.bounds.size
    }

    private static func getActiveWindow() -> UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows where window.isKeyWindow {
                return window
            }
        }
        return nil
    }
}
