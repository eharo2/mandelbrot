//
//  Gallery.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/7/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Gallery: View {
    @Binding var iterations: CGFloat
    @Binding var map0Dots: [CXPoint]
    @State var index: Int = 0
    @State var position: Int = 0
    @State var presentGuide = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    PanelBase(index: self.$index)
                    Panel0(iterations: self.$iterations, map0Dots: self.$map0Dots, presentGuide: self.$presentGuide)
                    Panel2()
                    .offset(CGSize(width: position == 2 ? 0 : w, height: 0))
                }
            }
            .frame(width: w - 10, height: 300)
            .foregroundColor(Color.black)
            .background(Color(white: 0.92))
            .cornerRadius(10)
        }
        .sheet(isPresented: $presentGuide, onDismiss: {
            self.presentGuide = false
        }, content: { () -> ColorPicker in
            ColorPicker(presentGuide: self.$presentGuide)
        })
    }
}
