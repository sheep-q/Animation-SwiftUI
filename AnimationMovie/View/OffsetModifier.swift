//
//  OffsetModifier.swift
//  AnimationMovie
//
//  Created by nguyen.van.quangf on 07/04/2022.
//

import Foundation
import SwiftUI

struct OffsetModifier: ViewModifier {
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(content: {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                }
                .onPreferenceChange(OffsetKey.self) { minY in
                    self.offset = minY
                }
            })
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
 
