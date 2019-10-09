//
//  Extensions.swift
//  ScanbotSdkWebKitNativeBridgeExample
//
//  Created by Eddy on 09.10.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import Foundation
import UIKit
import ScanbotSDK

extension FileManager {
    open func secureCopyItem(at srcURL: URL, to dstURL: URL) -> Bool {
        do {
            if FileManager.default.fileExists(atPath: dstURL.path) {
                try FileManager.default.removeItem(at: dstURL)
            }
            try FileManager.default.copyItem(at: srcURL, to: dstURL)
        } catch (let error) {
            print("Cannot copy item at \(srcURL) to \(dstURL): \(error)")
            return false
        }
        return true
    }
}

extension UIColor {
    static func parseFromHexString(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension SBSDKUIPage {
    var jsonDict: [String: Any?] {
        let dictionary: [String: Any?] = ["pageId": self.pageFileUUID.uuidString,
                                          "originalImageFileUri": self.originalImageURL()?.absoluteString ?? "",
                                          "documentImageFileUri": self.documentImageURL()?.absoluteString ?? "",
                                          "originalPreviewImageFileUri": self.documentPreviewImageURL()?.absoluteString ?? "",
                                          "documentPreviewImageFileUri": self.documentPreviewImageURL()?.absoluteString ?? ""]
                                          // TODO serialize other page properties
        return dictionary
    }
}

extension SBSDKUIDocument {
    var jsonString: String? {
        let pagesCount = self.numberOfPages()
        var pages: [[String: Any?]] = []
        for index in 0..<pagesCount {
            if let page = self.page(at: index)?.jsonDict {
                pages.append(page)
            }
        }
        return ["pages": pages].jsonString
    }
}

extension Dictionary {
    var jsonString: String? {
        if let json = try? JSONSerialization.data(withJSONObject: self) {
            return String(data: json, encoding: String.Encoding.utf8)
        }
        return nil
    }
}
