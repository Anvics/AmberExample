//
//  FeedFeedEvents.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Amber

enum FeedAction: AmberAction, AuthorizationRequirable{
    case itemsLoaded([FeedItem])
    case like(Int)
    
    var isAuthorizationRequired: Bool {
        if case .like(_) = self { return true }
        return false
    }
}

enum FeedInputAction: AmberAction{
//    case <#case#>
}

enum FeedOutputAction: AmberAction{
//    case <#case#>
}

enum FeedTransition: AmberTransition, AuthorizationRequirable{
    case profile
    case showPhoto(UIImage)
    
    var isAuthorizationRequired: Bool {
        if case .profile = self { return true }
        return false
    }
}


