//
//  FilterFilterReducerTests.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import XCTest
import ReactiveKit

class FilterReducerTests: XCTestCase{
    
    let store = SlideStore(reducer: FilterReducer(), router: FilterRouter(), requiredData: ())
 
    func testAction() {
        assert(<#action#>) { <#condition#> }
    }

    func assert(_ actions: FilterAction..., meetsCondition: (FilterState) -> Bool){
        actions.forEach(store.perform)
        XCTAssert(meetsCondition(store.currentState()))
    }
    
    func assert(timeOut: TimeInterval, actions: FilterAction..., meetsCondition: @escaping (FilterState) -> Bool){
        let expect = expectation(description: "FilterTest expectation for \(actions)")
        actions.forEach(store.perform)
        waitForExpectations(timeout: timeOut, handler: nil)
        let bag = DisposeBag()
        store.state.observeNext { state in
            if meetsCondition(state) { expect.fulfill() }
            bag.dispose()
        }.dispose(in: bag)
    }

}
