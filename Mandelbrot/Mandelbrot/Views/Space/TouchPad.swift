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
    @Binding var map0Dots: [CXPoint]
    @Binding var map1Dots: [CXPoint]
    @Binding var map2Dots: [CXPoint]
    @Binding var map3Dots: [CXPoint]
    @Binding var points: [CXPoint]
    @Binding var contained: Bool
    @Binding var shapes: [[CXPoint]]
    // STATE
    @State var touchState = TouchState.none

    var body: some View {
        GeometryReader { geometry in
            Path { _ in }
            .background(Color(white: 1, opacity: 0.01))
                .gesture(
                    DragGesture(minimumDistance: 0)
                    .onChanged({ (touch) in
                        // Get array of complex results
                        let result = self.getResultForLocation(touch.location, in: geometry)
                        // Add draw lines
                        self.addDrawLinesFromResult(result, in: geometry)
                        // Add Shapes
                        self.addShapesForResult(result, in: geometry)
                        // If contained add to map
                        self.addPointToMap0(result: result, in: geometry)
                        self.addPointToMap1(result: result, in: geometry)
                    })
                    .onEnded({ (touch) in
                        self.touchState = .ended
                    }
                )
            )
        }
        .frame(maxHeight: .infinity).clipped()
    }

    // MARK: - Gesture
    func getResultForLocation(_ location: CGPoint, in geometry: GeometryProxy) -> Result {
        self.touchState = (self.touchState == .none || self.touchState == .ended) ? .began : .moved
        self.touchPoint = CXPoint(absolutePoint: location, in: geometry)
        return Manager.resultForComplex(self.touchPoint, in: geometry, mode: mapMode)
    }

    func addDrawLinesFromResult(_ result: Result, in geometry: GeometryProxy) {
        self.points.removeAll()
        if mapMode == .juliaSet {
            self.points.append(self.touchPoint)
        }
        for number in result.numbers {
            number.calculateCoords(in: geometry.size)
            //print(number.stringCoords())
            self.points.append(number)
        }
    }
    
    func addShapesForResult(_ result: Result, in geometry: GeometryProxy) {
        guard result.shapePoints.count > 1 && result.shapePoints.count < 10 else { return }
        if self.shapes.count == 0 {
            self.shapes.append(result.shapePoints)
        } else {
            var shouldAdd = true
            for shape in self.shapes {
                if shape.count == result.shapePoints.count {
                    shouldAdd = false
                }
            }
            if shouldAdd {
                self.shapes.append(result.shapePoints)
            }
        }
    }
    
    func addPointToMap0(result: Result, in geometry: GeometryProxy) {
        if result.contained {
            self.map0Dots.append(self.touchPoint)
        }
        self.contained = result.contained
    }

    func addPointToMap1(result: Result, in geometry: GeometryProxy) {
        if result.numbers.count > 1 {
            if result.numbers[0].isCloseWithAnyTo(self.touchPoint) {
                self.map1Dots.append(self.touchPoint)
                self.map2Dots.append(result.numbers[0])
                self.map3Dots.append(result.numbers[1])
            }
        }
        self.contained = result.contained
    }
}
