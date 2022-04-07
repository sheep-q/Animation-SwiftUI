//
//  post.swift
//  AnimationMovie
//
//  Created by nguyen.van.quangf on 03/04/2022.
//

import Foundation

struct Post: Identifiable {
    var id = UUID().uuidString
    var postImage: String
}

struct WheelPost: Identifiable {
    var id = UUID().uuidString
    var postImage: String
    var title: String
    var description: String
    var starRating: Int
}

var wheelPosts = [
    WheelPost(postImage: "1", title: "Vũ Thị Hoài Linh", description: "aka Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises", starRating: 5),
    WheelPost(postImage: "2", title: "TiEmEo", description: "the God of Mischief, steps out of his borther's shadow to embark on an adventure that takes place after the events of Avengers: Endgame", starRating: 5),
    WheelPost(postImage: "3", title: "8/7/2018", description: "I'm in love with her\nTiiiiiii\nMoon and Sunday", starRating: 5),
    WheelPost(postImage: "4", title: "TiEmEo", description: "aka Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises", starRating: 5),
    WheelPost(postImage: "5", title: "SheepofG", description: "Always be happy \nThanSetNice\nsheep._.q", starRating: 5)
]
