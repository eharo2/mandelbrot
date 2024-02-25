//
//  File.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/8/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct PanelBase: View {
    @Binding var index: Int

    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .bottom) {
                ForEach(0..<4) { i in
                    Text("").frame(width: 8, height: 8)
                        .background(i == self.index ? Color.white : Color(white: 0.5))
                        .cornerRadius(40)
                }
            }.frame(width: 60, height: 24)
        }
        .frame(width: w - 6, height: 300)
        .animation(.easeInOut(duration: 0.3))
    }
}
