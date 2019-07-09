//
//  SafariViewController.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/22/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI
import SafariServices

struct SafariViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    let url: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariViewController>) -> SafariViewController.UIViewControllerType {
        return SFSafariViewController(url: URL(string: url)!)
    }

    func updateUIViewController(_ uiViewController: SafariViewController.UIViewControllerType, context: UIViewControllerRepresentableContext<SafariViewController>) {
    }
}
