//
//  Widget.swift
//  Canvas
//
//  Created by Nibin Varghese on 2024/09/29.
//

import SwiftUI

struct Widget: Identifiable {
    let id = UUID()
    let color: Color
    var position: CGPoint = .zero
    var width: CGFloat = 0
    var height: CGFloat = 0
    var frame: CGRect {
        return CGRect(origin: position, size: CGSize(width: width, height: height))
    }
}
