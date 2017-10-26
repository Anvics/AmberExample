//
//  AuthorizationAuthorizationReducer.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class AuthorizationReducer: AmberReducer{
    
    func initialize(state: AuthorizationState, performAction: @escaping (AuthorizationAction) -> Void, performOutputAction: @escaping (AuthorizationOutputAction) -> Void){
        
    }
    
    func reduce(action: AuthorizationAction, state: AuthorizationState, performTransition: @escaping (AuthorizationTransition) -> Void, performAction: @escaping (AuthorizationAction) -> Void, performOutputAction: @escaping (AuthorizationOutputAction) -> Void) -> AuthorizationState{
        switch action {
        case .completeAuthorization(let isSuccess):
            User.current.isAuthorized = isSuccess
            GCD_After(0.5) { performOutputAction(isSuccess ? .authorized : .unathorized) }
            performTransition(.close)
        }
        return state
    }
    
    func reduceInput(action: AuthorizationInputAction, state: AuthorizationState, performAction: @escaping (AuthorizationAction) -> Void, performOutputAction: @escaping (AuthorizationOutputAction) -> Void) -> AuthorizationState{
        var newState = state
//        switch action {
//        case <#pattern#>: <#code#>
//        }
        return newState
    }
}
