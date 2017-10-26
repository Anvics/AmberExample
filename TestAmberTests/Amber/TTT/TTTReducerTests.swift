//
//  TTTTTTReducerTests.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 26/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import XCTest
import ReactiveKit

class TTTReducerTests: XCTestCase{
    
    let store = SlideStore(reducer: TTTReducer(), router: TTTRouter(), requiredData: ())
 
    func testAction() {
        assert(<#action#>) { <#condition#> }
    }

    func assert(_ actions: TTTAction..., meetsCondition: (TTTState) -> Bool){
        actions.forEach(store.perform)
        XCTAssert(meetsCondition(store.currentState()))
    }
    
    func assert(timeOut: TimeInterval, actions: TTTAction..., meetsCondition: @escaping (TTTState) -> Bool){
        let expect = expectation(description: "TTTTest expectation for \(actions)")
        actions.forEach(store.perform)
        waitForExpectations(timeout: timeOut, handler: nil)
        let bag = DisposeBag()
        store.state.observeNext { state in
            if meetsCondition(state) { expect.fulfill() }
            bag.dispose()
        }.dispose(in: bag)
    }

}
