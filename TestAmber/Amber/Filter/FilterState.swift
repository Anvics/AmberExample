//
//  FilterFilterState.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Amber

struct FilterState: AmberState {

    var description: String { return "" }

    var inputImage: CIImage
    
    var saturation: CGFloat = 1
    var brightness: CGFloat = 0
    var contrast: CGFloat = 1
    
    var outputImage: UIImage{
        return inputImage.filtered(saturation: saturation, brightness: brightness, contrast: contrast)
    }

    init(data: UIImage) {
        inputImage = CIImage(image: data)!
    }
    
}

