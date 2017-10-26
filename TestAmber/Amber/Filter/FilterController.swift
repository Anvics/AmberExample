//
//  FilterFilterController.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Bond
import Amber

let FilterModule = FilterController.self

final class FilterController: UIViewController, AmberController {

    let store = AmberStore(reducer: FilterReducer(), router: FilterRouter())

    static let storyboardFile = "Main"
    static let storyboardID = "FilterController"

    //MARK: - IBOutlets

    @IBOutlet weak var saturationSlider: UISlider!
    @IBOutlet weak var brightnessSlider: UISlider!
    @IBOutlet weak var contrastSlider: UISlider!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindSlider(saturationSlider, value: { $0.saturation }, event: { .setSaturation($0) })
        bindSlider(brightnessSlider, value: { $0.brightness }, event: { .setBrighness($0) })
        bindSlider(contrastSlider, value: { $0.contrast }, event: { .setContrast($0) })
    }

    //MARK: - IBActions

}

//MARK: - Bindings
extension FilterController{
    fileprivate func bindSlider(_ slider: UISlider, value: @escaping (FilterState) -> CGFloat, event: @escaping (CGFloat) -> FilterAction){
        state.map { Float(value($0)) }.bind(to: slider.reactive.value)
        slider.reactive.value
            .skip(first: 1)
            .distinct()
            .map { event(CGFloat($0)) }
            .bind(to: action)
    }
}

//MARK: - Helpers
extension FilterController{

}

