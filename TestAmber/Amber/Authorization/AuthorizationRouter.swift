//
//  AuthorizationAuthorizationRouter.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class AuthorizationRouter: AmberRouter{
     func perform(transition: AuthorizationTransition, route: AmberRoutePerformer, reducer: AuthorizationReducer, performAction: @escaping (AuthorizationAction) -> Void){
        switch transition {
        case .close: route.close()
        }
    }
}
