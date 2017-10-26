//
//  FilterFilterEvents.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Amber

//Все действия, которые модуль выполняет над самим собой
enum FilterAction: AmberAction{
    case setSaturation(CGFloat), setBrighness(CGFloat), setContrast(CGFloat)
}

enum FilterInputAction: AmberAction{
    case reset
}

enum FilterOutputAction: AmberAction{
    case updateImage(UIImage)
}

//Все переходы, которые могут быть выполнены в этом модуле
enum FilterTransition: AmberTransition{
//    case <#case#>
}
