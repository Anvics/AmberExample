//
//  FeedItemFeedItemReducer.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class FeedItemReducer: AmberReducer{
    
    var filterInput: FilterReducer.InputActionListener?
    
    func initialize(state: FeedItemState, performAction: @escaping (FeedItemAction) -> Void, performOutputAction: @escaping (FeedItemOutputAction) -> Void){
        
    }
    
    func reduce(action: FeedItemAction, state: FeedItemState, performTransition: @escaping (FeedItemTransition) -> Void, performAction: @escaping (FeedItemAction) -> Void, performOutputAction: @escaping (FeedItemOutputAction) -> Void) -> FeedItemState{
        var newState = state
        switch action {
        case .reset: filterInput?(.reset)
        case .setImage(let image): newState.image = image
        }
        return newState
    }
    
    func reduceInput(action: FeedItemInputAction, state: FeedItemState, performAction: @escaping (FeedItemAction) -> Void, performOutputAction: @escaping (FeedItemOutputAction) -> Void) -> FeedItemState{
        return state
    }
}
