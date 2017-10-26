//
//  FeedItemFeedItemController.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 23/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Bond
import Amber

let FeedItemModule = FeedItemController.self

final class FeedItemController: UIViewController, AmberController {

    let store = AmberStore(reducer: FeedItemReducer(), router: FeedItemRouter())

    static let storyboardFile = "Main"
    static let storyboardID = "FeedItemController"

    //MARK: - IBOutlets
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var filtersView: UIView!
    
    @IBOutlet weak var resetButton: UIButton!

    @IBOutlet weak var cancelButton: UIButton!
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.perform(transition: FeedItemTransition.embedFilters(filtersView, store.currentState().image))
        
        state.map { $0.image }.bind(to: resultImageView.reactive.image)

        resetButton.reactive.tap.replace(with: .reset).bind(to: action)
        cancelButton.reactive.tap.replace(with: .close).bind(to: transition)
    }

    //MARK: - IBActions

}

//MARK: - Bindings
extension FeedItemController{

}

//MARK: - Helpers
extension FeedItemController{

}

