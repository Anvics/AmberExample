//
//  ProfileProfileRouter.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class ProfileRouter: AmberRouter{
     func perform(transition: ProfileTransition, route: AmberRoutePerformer, reducer: ProfileReducer, performAction: @escaping (ProfileAction) -> Void){
        switch transition {
        case .close: route.close()
        }
    }
}
