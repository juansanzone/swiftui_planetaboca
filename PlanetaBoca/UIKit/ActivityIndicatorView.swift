//
//  ActivityIndicatorView.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/23/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.hidesWhenStopped = true
        uiView.startAnimating()
    }
}
