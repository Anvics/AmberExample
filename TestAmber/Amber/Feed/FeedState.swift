//
//  FeedFeedState.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import Foundation
import Amber

struct FeedState: AmberState {

    var description: String {
        return "isLoading: \(isLoading), items: \(feedItems.count)"
    }
    
    var isLoading = true
    var feedItems: [FeedItem] = []

    init(data: Void) { }
}


