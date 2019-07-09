//
//  BlurView.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/30/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit
import SwiftUI

// BlurView.swift
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            ])
        return view
    }

    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {

    }
}
