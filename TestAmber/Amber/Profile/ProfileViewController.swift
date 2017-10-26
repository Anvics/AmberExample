//
//  ProfileProfileViewController.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Bond
import Amber

let ProfileModule = ProfileController.self

final class ProfileController: UIViewController, AmberController {

    let store = AmberStore(reducer: ProfileReducer(), router: ProfileRouter())

    static let storyboardFile = "Main"
    static let storyboardID = "ProfileController"

    //MARK: - IBOutlets
    @IBOutlet weak var closeButton: UIButton!

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    //MARK: - IBActions

}

//MARK: - Bindings
extension ProfileController{
    func bind(){
        closeButton.reactive.tap
            .replace(with: .close)
            .bind(to: transition)
    }
}

//MARK: - Helpers
extension ProfileController{

}

