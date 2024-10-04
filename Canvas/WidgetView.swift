//
//  WidgetView.swift
//  Canvas
//
//  Created by Nibin Varghese on 2024/09/29.
//

import SwiftUI

struct WidgetView: View {
    let widget: Widget
    
    var body: some View {
        RoundedRectangle(cornerRadius: 36)
            .fill(widget.color)
            .frame(width: 50, height: 50)
            .position(widget.position)
    }
}

