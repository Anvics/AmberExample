//
//  FeedItemFeedItemState.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Amber

struct FeedItemState: AmberState {

    var description: String { return image.description }
    
    var image: UIImage

    init(data: UIImage) { image = data }
}

