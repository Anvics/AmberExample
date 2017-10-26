//
//  FeedItemFeedItemRouter.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class FeedItemRouter: AmberRouter{
     func perform(transition: FeedItemTransition,
                  route: AmberRoutePerformer,
                  reducer: FeedItemReducer,
                  performAction: @escaping (FeedItemAction) -> Void){
        switch transition {
        case .close: route.close()
        case .embedFilters(let view, let image):
            reducer.filterInput = route.embed(FilterModule, data: image, inView: view) { a in
                switch a{
                case .updateImage(let image): performAction(.setImage(image))
                }
            }
        }
    }
}

