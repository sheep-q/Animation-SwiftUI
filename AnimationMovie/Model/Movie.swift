//
//  Movie.swift
//  AnimationMovie
//
//  Created by nguyen.van.quangf on 01/04/2022.
//

import Foundation

// MARK: - movie data model and sample movie data

struct Movie: Identifiable {
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
}

var movies: [Movie] = [
    Movie(movieTitle: "My love", artwork: "1"),
    Movie(movieTitle: "Tiiiiiii", artwork: "2"),
    Movie(movieTitle: "Moonday", artwork: "3"),
    Movie(movieTitle: "8/7/2018", artwork: "4"),
    Movie(movieTitle: "SheepofG", artwork: "5")
//    Movie(movieTitle: "My love", artwork: "1"),
//    Movie(movieTitle: "Tiiiiiii", artwork: "2"),
]

var sampleText = "Người Nhện: Không còn nhà (tựa gốc tiếng Anh: Spider-Man: No Way Home) là một bộ phim siêu anh hùng năm 2021 của Mỹ dựa trên nhân vật Peter Parker của Marvel Comics, do Columbia Pictures và Marvel Studios đồng sản xuất và được phân phối bởi Sony Pictures Releasing. Bộ phim là phần tiếp theo của Người Nhện: Trở về nhà (2017) và Người Nhện xa nhà (2019) và là phần phim thứ 27 của Vũ trụ Điện ảnh Marvel (MCU). Bộ phim do Jon Watts đạo diễn và kịch bản được chấp bút bởi Chris McKenna và Erik Sommers. Phim có sự tham gia của Tom Holland trong vai Peter Parker cùng với Zendaya, Benedict Cumberbatch, Jacob Batalon, Jon Favreau, Jamie Foxx, Willem Dafoe, Alfred Molina, Benedict Wong, Tony Revolori, Marisa Tomei, Andrew Garfield và Tobey Maguire."
