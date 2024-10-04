//
//  Utility.swift
//  Canvas
//
//  Created by Nibin Varghese on 2024/09/29.
//

import SwiftUI

let canvasSize: CGSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 300)

func adjustWidgets(_ widgets: inout [Widget], canvasWidth: CGFloat, canvasHeight: CGFloat) {
    let count = widgets.count
    guard count > 0 else { return }
    
    if count == 1 {
        widgets[0].width = canvasWidth
        widgets[0].height = canvasHeight
        widgets[0].position = CGPoint(x: canvasWidth / 2, y: canvasHeight / 2)
    } else {
        var rows: Int = 1
        var columns: Int = 1
        
        if count == 2 {
            rows = 1
            columns = 2
        } else if count <= 4 {
            rows = 2
            columns = 2
        } else if count <= 6 {
            rows = 2
            columns = 3
        } else {
            rows = 3
            columns = 3
        }
        
        let widgetWidth = canvasWidth / CGFloat(columns)
        let widgetHeight = canvasHeight / CGFloat(rows)
        
        for (index, _) in widgets.enumerated() {
            let rowIndex = index / columns
            let columnIndex = index % columns
            
            let xPosition = widgetWidth * CGFloat(columnIndex) + (widgetWidth / 2)
            let yPosition = widgetHeight * CGFloat(rowIndex) + (widgetHeight / 2)
            
            widgets[index].width = widgetWidth
            widgets[index].height = widgetHeight
            widgets[index].position = CGPoint(x: xPosition, y: yPosition)
        }
    }
}

private func isWithinCanvas(_ frame: CGRect) -> Bool {
    return frame.minX >= 0 && frame.maxX <= canvasSize.width &&
    frame.minY >= 0 && frame.maxY <= canvasSize.height
}
