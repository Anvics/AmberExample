//
//  AuthorizationAuthorizationEvents.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Amber

//Все действия, которые модуль выполняет над самим собой
enum AuthorizationAction: AmberAction{
    case completeAuthorization(Bool)
}

//Все действия, которые посылает этому модулю тот модуль, который его презентовал/встроил
enum AuthorizationInputAction: AmberAction{
//    case <#case#>
}

//Все действия, которые этот модуль может послать тому модулю, который его презентовал/встроил
enum AuthorizationOutputAction: AmberAction{
    case authorized, unathorized
}

//Все переходы, которые могут быть выполнены в этом модуле
enum AuthorizationTransition: AmberTransition{
    case close
}
