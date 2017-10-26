//
//  FeedFeedReducerTests.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import XCTest
import ReactiveKit

class NoFeedItemsLoader: FeedItemLoaderProtocol {
    func load(completion: @escaping ([FeedItem]) -> Void){
        completion([])
    }
}


class FeedReducerTests: XCTestCase{
    
    let store = AmberStore(reducer: FeedReducer(loader: NoFeedItemsLoader()),
                           router: FeedRouter(),
                           requiredData: ())
 
    func testAction() {
        let item = FeedItem(id: 0, title: "Test", image: nil)
        assert(.itemsLoaded([item]), .like(item)) { state in
            state.feedItems.count == 1 && state.feedItems[0].isLiked
        }
    }

    func assert(_ actions: FeedAction..., meetsCondition: (FeedState) -> Bool){
        actions.forEach(store.perform)
        XCTAssert(meetsCondition(store.currentState()))
    }
    
    func assert(timeOut: TimeInterval, actions: FeedAction..., meetsCondition: @escaping (FeedState) -> Bool){
        let expect = expectation(description: "FeedTest expectation for \(actions)")
        actions.forEach(store.perform)
        waitForExpectations(timeout: timeOut, handler: nil)
        let bag = DisposeBag()
        store.state.observeNext { state in
            if meetsCondition(state) { expect.fulfill() }
            bag.dispose()
        }.dispose(in: bag)
    }

}
