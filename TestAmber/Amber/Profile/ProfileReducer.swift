//
//  ProfileProfileReducer.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class ProfileReducer: AmberReducer{
    
    func initialize(state: ProfileState, performAction: @escaping (ProfileAction) -> Void, performOutputAction: @escaping (ProfileOutputAction) -> Void){
        
    }
    
    func reduce(action: ProfileAction, state: ProfileState, performTransition: @escaping (ProfileTransition) -> Void, performAction: @escaping (ProfileAction) -> Void, performOutputAction: @escaping (ProfileOutputAction) -> Void) -> ProfileState{
        var newState = state
//        switch action {
//        case <#pattern#>: <#code#>
//        }
        return newState
    }
    
    func reduceInput(action: ProfileInputAction, state: ProfileState, performAction: @escaping (ProfileAction) -> Void, performOutputAction: @escaping (ProfileOutputAction) -> Void) -> ProfileState{
        var newState = state
//        switch action {
//        case <#pattern#>: <#code#>
//        }
        return newState
    }
}
