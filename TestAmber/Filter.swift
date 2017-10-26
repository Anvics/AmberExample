//
//  Filter.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23.10.2017.
//  Copyright © 2017 Nikita Arkhipov. All rights reserved.
//

import UIKit
import CoreImage
import Animatics

extension CIImage{
    func filtered(saturation: CGFloat, brightness: CGFloat, contrast: CGFloat) -> UIImage{        
        let image = (Filter.Saturation(saturation, brightness: brightness, contrast: contrast))(self)
        return UIImage(ciImage: image)
    }
}
