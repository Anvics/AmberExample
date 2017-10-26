//
//  FeedFeedReducer.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class FeedReducer: AmberReducer{
    let loader: FeedItemLoaderProtocol

    init(loader: FeedItemLoaderProtocol = FakeFeedItemLoader()){
        self.loader = loader
    }
    
    func initialize(state: FeedState,
                    performAction: @escaping (FeedAction) -> Void,
                    performOutputAction: @escaping (FeedOutputAction) -> Void){
        loader.load(completion: { items in
            performAction(.itemsLoaded(items))
        })
    }
    
    func reduce(action: FeedAction, state: FeedState,
                performTransition: @escaping (FeedTransition) -> Void,
                performAction: @escaping (FeedAction) -> Void,
                performOutputAction: @escaping (FeedOutputAction) -> Void) -> FeedState{
        var newState = state
        switch action {
        case .itemsLoaded(let items):
            newState.isLoading = false
            newState.feedItems = items
        case .like(let index):
            let item = newState.feedItems[index]
            item.isLiked = !item.isLiked
        }
        return newState
    }
    
    func reduceInput(action: FeedInputAction, state: FeedState, performAction: @escaping (FeedAction) -> Void, performOutputAction: @escaping (FeedOutputAction) -> Void) -> FeedState{
        return state
    }
}
