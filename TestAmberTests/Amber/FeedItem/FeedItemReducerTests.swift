//
//  FeedItemFeedItemReducerTests.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import XCTest
import ReactiveKit

class FeedItemReducerTests: XCTestCase{
    
    let store = SlideStore(reducer: FeedItemReducer(), router: FeedItemRouter(), requiredData: ())
 
    func testAction() {
        assert(<#action#>) { <#condition#> }
    }

    func assert(_ actions: FeedItemAction..., meetsCondition: (FeedItemState) -> Bool){
        actions.forEach(store.perform)
        XCTAssert(meetsCondition(store.currentState()))
    }
    
    func assert(timeOut: TimeInterval, actions: FeedItemAction..., meetsCondition: @escaping (FeedItemState) -> Bool){
        let expect = expectation(description: "FeedItemTest expectation for \(actions)")
        actions.forEach(store.perform)
        waitForExpectations(timeout: timeOut, handler: nil)
        let bag = DisposeBag()
        store.state.observeNext { state in
            if meetsCondition(state) { expect.fulfill() }
            bag.dispose()
        }.dispose(in: bag)
    }

}
