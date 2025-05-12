//
//  PPLSShareFontService.swift
//  PPLSShareFont
//
//  Created by PPLSShareFont on 2025/5/12.
//


import UIKit
import QuartzCore

@objc public class PPLSShareFontService: NSObject {
    
    @objc public var shared: PPLSShareFontService = .init()
    
    // 添加这个新方法来获取框架的资源 Bundle
    public class func bundle() -> Bundle {
        let bundle = Bundle(for: PPLSShareFontService.self)
        
        // 尝试查找资源 Bundle
        if let bundleURL = bundle.resourceURL?.appendingPathComponent("PPLSShareFont.bundle"),
           let resourceBundle = Bundle(url: bundleURL) {
            return resourceBundle
        }
        
        // 如果找不到资源 Bundle，返回框架 Bundle
        return bundle
    }
}


public extension PPLSShareFontService {
    
    @objc static func ppls_registerFont() -> Bool {
        
        let ttfFonts = bundle().urls(forResourcesWithExtension: "ttf", subdirectory: nil) ?? []
        let TTFFonts = bundle().urls(forResourcesWithExtension: "TTF", subdirectory: nil) ?? []
        let otfFonts = bundle().urls(forResourcesWithExtension: "otf", subdirectory: nil) ?? []
        let OTFFonts = bundle().urls(forResourcesWithExtension: "OTF", subdirectory: nil) ?? []
        
        let fontUrls = ttfFonts + TTFFonts + otfFonts + OTFFonts
        
        debugPrint("all fontUrls: \(fontUrls.count)")
        
        if fontUrls.isEmpty {
            debugPrint("没有找到任何字体文件...")
            return false
        }
        var success = false
        for fontUrl in fontUrls {
            guard let fontData = try? Data(contentsOf: fontUrl),
                  let provider = CGDataProvider(data: fontData as CFData),
                  let font = CGFont(provider) else {
                success = false
                continue
            }
            
            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterGraphicsFont(font, &error) {
                if let errorUnmanaged = error {
                    let errorDescription = CFErrorCopyDescription(errorUnmanaged.takeRetainedValue())
                    debugPrint("加载字体失败 \(fontUrl.lastPathComponent): \(errorDescription)")
                }
                success = false
            } else {
                success = true
            }
        }
        return success
    }
    
    
    @objc static func printAllFont() {
        for family in UIFont.familyNames {
            print("字体家族: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("- 字体名称: \(name)")
            }
        }
    }
}
