//
//  ColorPicker.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 19.07.19.
//  Copyright © 2019 code3e. All rights reserved.
//

import SwiftUI

struct ColorPicker: View {
    @Binding var presentGuide: Bool

    private let colors = ColorsProvider.supportedColors()

    var body: some View {
        List(colors) { colorInfo in
            ColorEntry(colorInfo: colorInfo)
                .onTapGesture {
                //self.color = colorInfo.color
                self.presentGuide = false
            }
        }
    }
}
