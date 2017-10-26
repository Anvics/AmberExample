//
//  FeedItemFeedItemEvents.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Amber

//Все действия, которые модуль выполняет над самим собой
enum FeedItemAction: AmberAction{
    case reset, setImage(UIImage)
}

//Все действия, которые посылает этому модулю тот модуль, который его презентовал/встроил
enum FeedItemInputAction: AmberAction{
//    case <#case#>
}

//Все действия, которые этот модуль может послать тому модулю, который его презентовал/встроил
enum FeedItemOutputAction: AmberAction{
//    case <#case#>
}

//Все переходы, которые могут быть выполнены в этом модуле
enum FeedItemTransition: AmberTransition{
    case embedFilters(UIView, UIImage), close
}
