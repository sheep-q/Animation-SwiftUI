//
//  WheelCarouselSlider.swift
//  AnimationMovie
//
//  Created by nguyen.van.quangf on 01/04/2022.
//

import SwiftUI

struct WheelCarouselSlider: View {
    
    @State var currentIndex = 0
    
    var body: some View {
        ZStack {
            // background view
            TabView(selection: $currentIndex) {
                ForEach(wheelPosts.indices, id: \.self) { index in
                    GeometryReader { proxy in
                        Image(wheelPosts[index].postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width,
                                   height: proxy.size.height)
                    }
                    .ignoresSafeArea()
                    .offset(y: -260)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            .overlay(
                LinearGradient(colors: [
                    Color.clear,
                    Color.black.opacity(0.2),
                    Color.white.opacity(0.4),
                    Color.white,
                    Color.white,
                    Color.white
                ], startPoint: .top, endPoint: .bottom)
            )
            .ignoresSafeArea()
            
            // snapView
            SnapCarousel(trailingSpace: 150, index: $currentIndex, items: wheelPosts) { post in
                CardView(post: post)
            }
            .offset(y: getRect().height / 3 + 20)
        }
    }
    
    @ViewBuilder
    func CardView(post: WheelPost) -> some View {
        VStack(spacing: 10) {
            GeometryReader { proxy in
                Image(post.postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
                    .cornerRadius(25)
            }
            .padding(15)
            .background(.white)
            .cornerRadius(30)
            .frame(height: getRect().height / 2.5)
            .padding(.bottom, 15)
            
            Text(post.title)
                .font(.title2.bold())
            
            HStack(spacing: 3) {
                ForEach (1...5, id: \.self) { index in
                    Image(systemName: "star.fill")
                        .foregroundColor((index <= post.starRating ? .yellow : .gray))
                }
                
                Text("\(post.starRating).0")
            }
            .font(.caption)
            
            Text(post.description)
                .font(.callout)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .padding(.horizontal)
        }
    }
}

struct WheelCarouselSlider_Previews: PreviewProvider {
    static var previews: some View {
        WheelCarouselSlider()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
