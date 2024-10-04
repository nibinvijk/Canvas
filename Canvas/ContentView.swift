//
//  ContentView.swift
//  Canvas
//
//  Created by Nibin Varghese on 2024/09/29.
//

import SwiftUI

struct ContentView: View {
    @State private var widgets: [Widget] = []
    
    let colors: [Color] = [.skyBlue, .hotPink, .brightYellow, .limeGreen, .vibrantOrange]
    
    var body: some View {
        VStack {
            Spacer()
            
            CanvasView(widgets: $widgets, canvasWidth: canvasSize.width, canvasHeight: canvasSize.height)
                .padding()
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 36)
                .fill(Color.white)
                .overlay(
                    HStack {
                        ForEach(colors, id: \.self) { color in
                            ColorButton(color: color) { location in
                                if location.x >= 20 && location.x <= canvasSize.width + 20 && location.y <= canvasSize.height {
                                    let newWidget = Widget(color: color)
                                    widgets.append(newWidget)
                                    adjustWidgets(&widgets, canvasWidth: canvasSize.width, canvasHeight: canvasSize.height)
                                }
                            }
                        }
                    }
                    .padding()
                )
                .frame(height: 70)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .padding()
            
        }
        .background(Color.white)
    }
    
    private func doesOverlap(rect: CGRect) -> Bool {
        return widgets.contains(where: { $0.frame.intersects(rect) })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
