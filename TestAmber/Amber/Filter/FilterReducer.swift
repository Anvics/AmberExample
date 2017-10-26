//
//  FilterFilterReducer.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class FilterReducer: AmberReducer{
    
    func initialize(state: FilterState, performAction: @escaping (FilterAction) -> Void, performOutputAction: @escaping (FilterOutputAction) -> Void){
        
    }
    
    func reduce(action: FilterAction, state: FilterState, performTransition: @escaping (FilterTransition) -> Void, performAction: @escaping (FilterAction) -> Void, performOutputAction: @escaping (FilterOutputAction) -> Void) -> FilterState{
        var newState = state
        switch action {
        case .setSaturation(let saturation): newState.saturation = saturation
        case .setBrighness(let brightness): newState.brightness = brightness
        case .setContrast(let contrast): newState.contrast = contrast
        }
        updateImage(state: newState, performOutputAction: performOutputAction)
        return newState
    }
    
    func reduceInput(action: FilterInputAction, state: FilterState, performAction: @escaping (FilterAction) -> Void, performOutputAction: @escaping (FilterOutputAction) -> Void) -> FilterState{
        var newState = state
        switch action {
        case .reset:
            newState.saturation = 1
            newState.brightness = 0
            newState.contrast = 1
        }
        updateImage(state: newState, performOutputAction: performOutputAction)
        return newState
    }
    
    private func updateImage(state: FilterState, performOutputAction: @escaping (FilterOutputAction) -> Void){
        GCD_Background {
            let image = state.outputImage
            GCD_Main {
                performOutputAction(.updateImage(image))
            }
        }

    }
}
