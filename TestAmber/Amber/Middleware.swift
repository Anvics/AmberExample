//
//  Middleware.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11.10.2017.
//  Copyright © 2017 Nikita Arkhipov. All rights reserved.
//

import Foundation
import Amber

protocol AuthorizationRequirable {
    var isAuthorizationRequired: Bool { get }
}

class AuthMiddleware: AmberMiddleware{
    func perform(event: Any, onState state: Any, route: AmberRoutePerformer, performBlock: @escaping () -> ()){
        guard let authEvent = event as? AuthorizationRequirable,
            authEvent.isAuthorizationRequired && !User.current.isAuthorized else{
            performBlock()
            return
        }
        _ = route.show(AuthorizationModule) {
            if $0 == .authorized { performBlock() }
        }
    }
}


class ThreadLoggingMiddleware: AmberMiddleware{
    func process(state: Any, afterEvent event: Any, route: AmberRoutePerformer){
        print("----------------------------------------")
        print("[\(Thread.current.name ?? "")] \(type(of: event)).\(event) -> \(state)")
    }
}
