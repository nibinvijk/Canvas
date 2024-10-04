//
//  DraggableWidget.swift
//  Canvas
//
//  Created by Nibin Varghese on 2024/09/29.
//

import SwiftUI

struct DraggableWidget: View {
    let widget: Widget
    let canvasWidth: CGFloat
    let canvasHeight: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 36)
            .fill(widget.color)
            .frame(width: widget.width, height: widget.height)
            .position(widget.position) 
    }
}
