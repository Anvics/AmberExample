//
//  FeedItem.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11.10.2017.
//  Copyright © 2017 Nikita Arkhipov. All rights reserved.
//

import UIKit

class FeedItem: Equatable, CustomStringConvertible{
    let id: Int
    let title: String
    let image: UIImage?

    var isLiked = false

    init(id: Int, title: String, image: UIImage?){
        self.id = id
        self.title = title
        self.image = image
    }
    
    static func ==(lhs: FeedItem, rhs: FeedItem) -> Bool{
        return lhs.id == rhs.id
    }
    
    var description: String { return title }
}



protocol FeedItemLoaderProtocol {
    func load(completion: @escaping ([FeedItem]) -> Void)
}

class FakeFeedItemLoader: FeedItemLoaderProtocol{
    func load(completion: @escaping ([FeedItem]) -> Void){
        GCD_After(1.5) {
            completion([
                FeedItem(id: 0, title: "Paris", image: UIImage(named: "1")),
                FeedItem(id: 1, title: "Flying man", image: UIImage(named: "2")),
                FeedItem(id: 2, title: "Old Car", image: UIImage(named: "3")),
                ])
        }
    }
}


func GCD_After(_ time: TimeInterval, block: @escaping () -> ()){
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        block()
    }
}

