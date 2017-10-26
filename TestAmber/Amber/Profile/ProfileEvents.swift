//
//  ProfileProfileEvents.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Amber

//Все действия, которые модуль выполняет над самим собой
enum ProfileAction: AmberAction{
//    case <#case#>
}

//Все действия, которые посылает этому модулю тот модуль, который его презентовал/встроил
enum ProfileInputAction: AmberAction{
//    case <#case#>
}

//Все действия, которые этот модуль может послать тому модулю, который его презентовал/встроил
enum ProfileOutputAction: AmberAction{
//    case <#case#>
}

//Все переходы, которые могут быть выполнены в этом модуле
enum ProfileTransition: AmberTransition{
    case close
}
