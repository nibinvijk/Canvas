//
//  CanvasView.swift
//  Canvas
//
//  Created by Nibin Varghese on 2024/09/29.
//

import SwiftUI

struct CanvasView: View {
    @Binding var widgets: [Widget]
    let canvasWidth: CGFloat
    let canvasHeight: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.lightGray, style: StrokeStyle(lineWidth: 2, dash: [5]))
                .frame(width: canvasWidth, height: canvasHeight)

            if widgets.isEmpty {
                VStack {
                    Text("👋")
                        .font(.largeTitle)
                    Text("Hi!\nDrag and drop your widgets to unleash your creativity!")
                        .font(.headline)
                        .foregroundColor(.lightGray)
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }
            
            ForEach(widgets.indices, id: \.self) { index in
                DraggableWidget(widget: widgets[index], canvasWidth: canvasWidth, canvasHeight: canvasHeight)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newX = min(max(value.location.x, 20), canvasWidth + 20)
                                let newY = min(max(value.location.y, 0), canvasHeight)
                                widgets[index].position = CGPoint(x: newX, y: newY)
                                adjustWidgets(&widgets, canvasWidth: canvasWidth, canvasHeight: canvasHeight)
                            }
                    )
            }
        }
        .frame(width: canvasWidth, height: canvasHeight)
        .cornerRadius(20)
    }
}
