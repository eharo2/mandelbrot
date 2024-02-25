//
//  DrawingControls.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 19.07.19.
//  Copyright © 2019 code3e. All rights reserved.
//

import SwiftUI

//struct Panel: View {
//    @State var color = Color.red
//    @State var lineWidth: CGFloat = 1.0
//    
//    @State private var colorPickerShown = false
//
//    private let spacing: CGFloat = 40
//    
////    var body: some View {
////        NavigationView {
////            VStack {
////                //HStack(spacing: spacing) {
////                Text(" ")
////                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
////                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
////                //.edgesIgnoringSafeArea(.all)
////                HStack {
////                    Button("Pick color") {
////                        self.colorPickerShown = true
////                    }
////                    Button("Undo") {
////                        //if self.drawings.count > 0 {
////                          //  self.drawings.removeLast()
////                        //}
////                    }
////                    Button("Clear") {
////                        //self.drawings = [Drawing]()
////                    }
////                }
////                //.border(Color.blue)
////                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
////                HStack {
////                    Text("Pencil width").padding()
////                    Slider(value: $lineWidth, in: CGFloat(0)...CGFloat(15),step:CGFloat(1)).padding()
////                }
////                //.border(Color.blue)
////                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
////            }
//////            .border(Color.blue)
////            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
////        }
////        .frame(height: 250)
////        //.border(Color.red)
////        //.background(Color.yellow)
////        .sheet(isPresented: $colorPickerShown, onDismiss: {
////            self.colorPickerShown = false
////        }, content: { () -> ColorPicker in
////            ColorPicker(presentGuide: self.$presentGuide)
////        })
////    }
//}
