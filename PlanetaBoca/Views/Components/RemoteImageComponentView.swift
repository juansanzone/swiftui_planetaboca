//
//  JSRemoteImage.swift
//  PlanetaBoca
//
//  Created by Juan Sebastian Sanzone on 6/29/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI

struct JSRemoteImage: View {
    let imageUrl: String
    @State var uiImage: UIImage?
    @State private var loaded: Bool = false

    var body: some View {
        Image(uiImage: uiImage ?? UIImage()).resizable().renderingMode(.original)
            .onAppear() {
                self.fetchImage()
            }
    }

    private func fetchImage() {
        if loaded {
            return
        }

        if let cachedData = JSRemoteImageCache.shared.get(imageUrl), !cachedData.isEmpty {
            // From cache
            withAnimation {
                 self.uiImage = UIImage(data: cachedData)
            }
            self.loaded = true
        } else {
            // From network
            if let remoteUrl = URL(string: imageUrl) {
                self.loaded = true
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: remoteUrl), !data.isEmpty {
                        withAnimation {
                            self.uiImage = UIImage(data: data)
                        }
                        JSRemoteImageCache.shared.save(data, key: self.imageUrl)
                    }
                }
            }
        }
    }
}

struct JSRemoteImageCache {
    private let cache = NSCache<NSString, NSData>()
    static let shared = JSRemoteImageCache()

    func save(_ object: Data, key: String) {
        DispatchQueue.main.async {
            #if DEBUG
                print("CACHE - CACHED NEW - \(self.getKey(key))")
            #endif
            self.cache.setObject(NSData(data: object), forKey: self.getKey(key))
        }
    }

    func get(_ key: String) -> Data? {
        if let cached = cache.object(forKey: getKey(key)) {
            #if DEBUG
                print("CACHE - CACHE RETRIEVE - \(self.getKey(key))")
            #endif
            return Data(referencing: cached)
        }
        return nil
    }

    func isCached(_ key: String) -> Bool {
        return cache.object(forKey: getKey(key)) != nil
    }

    private func getKey(_ key: String) -> NSString {
        return key.replacingOccurrences(of: " ", with: "").lowercased() as NSString
    }
}
