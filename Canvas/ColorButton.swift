//
//  ColorButton.swift
//  Canvas
//
//  Created by Nibin Varghese on 2024/09/29.
//

import SwiftUI

struct ColorButton: View {
    let color: Color
    let onDrop: (CGPoint) -> Void
    
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 50, height: 50)
            .offset(dragOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation
                    }
                    .onEnded { value in
                        onDrop(value.location)
                        dragOffset = .zero
                    }
            )
    }
}
