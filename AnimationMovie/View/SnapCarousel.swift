//
//  SnapCarousel.swift
//  AnimationMovie
//
//  Created by nguyen.van.quangf on 03/04/2022.
//

import SwiftUI

struct SnapCarousel <Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    // Properties
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 120, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    // Offset
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader { proxy in
            
            // Settings correct width for snap carousel
            // one sided snap caorsel
            
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                    // MARK: - Wheel snap carousel
                        .offset(y: getOffset(item: item, width: width))
                } 
            }
            .padding(.horizontal, spacing)
            // settings only after 0th index
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 1) + offset)
            .gesture(
                DragGesture()
                    .updating($offset,
                              body: { value, out, _ in
                                  // MARK: -  Smooth hero effect
                                  // making it litter bit slower
                                  out = value.translation.width / 1.5
//                                  out = value.translation.width
                              })
                    .onEnded({ value in
                        // Updating Current Index
                        let offsetX = value.translation.width
                        
                        // we're going to convert the translation into progress 0 - 1
                        // and round the value ...
                        // based on th progress increasing or decrasing th currentIndex
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        //settigns minn
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        currentIndex = index
                    })
                    .onChanged({ value in
                        // Updating Current Index
                        let offsetX = value.translation.width
                        
                        // we're going to convert the translation into progress 0 - 1
                        // and round the value ...
                        // based on th progress increasing or decrasing th currentIndex
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        //settigns minn
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
        }
        // animating when offset = 0
        .animation(.easeInOut, value: offset == 0)
    }
    
    // MARK: - Wheel snap carousel
    // moving view based on scrool offfet
    func getOffset(item: T, width: CGFloat) -> CGFloat {
        // shifting current item to top ...
        let progress = ((offset < 0 ? offset : -offset) / width) * 60
        
        // max 60
        let topOffset = -progress < 60 ? progress : -(progress + 120)
        let previous = getIndex(item: item) - 1 == currentIndex ? (offset < 0 ? topOffset : -topOffset) : 0
        let next = getIndex(item: item) + 1 == currentIndex ? (offset < 0 ? -topOffset : +topOffset) : 0
        
        // safety check between 0 to max list size
        let checkBetween = currentIndex >= 0 && currentIndex < list.count ? (getIndex(item: item) - 1 == currentIndex ? previous : next) : 0
        return getIndex(item: item) == currentIndex ? -60 - topOffset : checkBetween
    }
    
    // fetching index
    func getIndex(item: T) -> Int {
        let index = list.firstIndex { currentItem in
            return currentItem.id == item.id
        } ?? 0
        
        return index
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        WheelCarouselSlider()
    }
}
