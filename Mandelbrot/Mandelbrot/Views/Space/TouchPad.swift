//
//  TouchPad.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 2/13/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct TouchPad: View {
    @Binding var touchPoint: CXPoint
    @Binding var dotMaps: [[CXPoint]]
    @Binding var points: [CXPoint]
    @Binding var contained: Bool
    @Binding var shapes: [[CXPoint]]

    @State var touchState = TouchState.none

    var body: some View {
        GeometryReader { geometry in
            Path { _ in }
            .background(Color(white: 1, opacity: 0.01))
                .gesture(
                    DragGesture(minimumDistance: 0)
                    .onChanged({ (touch) in
                        // Get array of complex results
                        let result = getResultForLocation(touch.location, in: geometry)
                        // Add draw lines
                        addDrawLinesFromResult(result, in: geometry)
                        // Add Shapes
                        addShapesForResult(result, in: geometry)
                        // If contained add to map
                        addPointToMap0(result: result, in: geometry)
                        addPointToMap1(result: result, in: geometry)
                    })
                    .onEnded({ (touch) in
                        touchState = .ended
                    }
                )
            )
        }
        .frame(maxHeight: .infinity).clipped()
    }

    // MARK: - Gesture
    func getResultForLocation(_ location: CGPoint, in geometry: GeometryProxy) -> Result {
        touchState = (touchState == .none || touchState == .ended) ? .began : .moved
        touchPoint = CXPoint(absolutePoint: location, in: geometry)
        return Manager.resultForComplex(touchPoint, in: geometry, mode: mapMode)
    }

    func addDrawLinesFromResult(_ result: Result, in geometry: GeometryProxy) {
        points.removeAll()
        if mapMode == .juliaSet {
            points.append(touchPoint)
        }
        for number in result.numbers {
            number.calculateCoords(in: geometry.size)
            //print(number.stringCoords())
            points.append(number)
        }
    }
    
    func addShapesForResult(_ result: Result, in geometry: GeometryProxy) {
        guard result.shapePoints.count > 1 && result.shapePoints.count < 10 else { return }
        if shapes.count == 0 {
            shapes.append(result.shapePoints)
        } else {
            var shouldAdd = true
            for shape in shapes {
                if shape.count == result.shapePoints.count {
                    shouldAdd = false
                }
            }
            if shouldAdd {
                shapes.append(result.shapePoints)
            }
        }
    }
    
    func addPointToMap0(result: Result, in geometry: GeometryProxy) {
        if result.contained {
            dotMaps[0].append(touchPoint)
        }
        contained = result.contained
    }

    func addPointToMap1(result: Result, in geometry: GeometryProxy) {
        if result.numbers.count > 1 {
            if result.numbers[0].isCloseWithAnyTo(touchPoint) {
                dotMaps[1].append(touchPoint)
                dotMaps[2].append(result.numbers[0])
                dotMaps[3].append(result.numbers[1])
            }
        }
        contained = result.contained
    }
}

enum TouchState {
    case none, began, moved, ended
    var name: String {
        return "\(self)"
    }
}
