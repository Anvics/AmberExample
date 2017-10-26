//
//  FeedFeedRouter.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//
import Amber

class FeedRouter: AmberRouter{
    func perform(transition: FeedTransition,
                 route: AmberRoutePerformer,
                 reducer: FeedReducer,
                 performAction: @escaping (FeedAction) -> Void){
        switch transition {
        case .profile: _ = route.show(ProfileModule)
        case .showPhoto(let image): _ = route.show(FeedItemModule, data: image)
        }
    }
}


