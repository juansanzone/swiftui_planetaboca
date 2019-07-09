//
//  ThemeManager.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/18/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: ThemeManager
struct ThemeManager {
    // Color names use to build UIColor and SwiftUI Color by name.
    enum ColorNames: String {
        case placeHolder
        case navigationTitleColor
        case iconsOverWhite

        func getName() -> String {
            return self.rawValue
        }
    }

    // UIColors
    static let navigationTitleColor: UIColor = UIColor(named: ColorNames.navigationTitleColor.getName()) ?? .black

    // Getter for SwiftUI Color
    static func getColor(_ forName: ColorNames) -> Color {
        return Color(forName.getName())
    }
}

// MARK: Appearance Method
extension ThemeManager {
    static func customizeAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.navigationTitleColor]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.navigationTitleColor]
        UIActivityIndicatorView.appearance().tintColor = navigationTitleColor
    }
}
