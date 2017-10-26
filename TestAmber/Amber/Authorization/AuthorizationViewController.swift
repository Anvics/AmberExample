//
//  AuthorizationAuthorizationViewController.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Bond
import Amber

let AuthorizationModule = AuthorizationController.self

final class AuthorizationController: UIViewController, AmberController {

    let store = AmberStore(reducer: AuthorizationReducer(), router: AuthorizationRouter())

    static let storyboardFile = "Main"
    static let storyboardID = "AuthorizationController"

    //MARK: - IBOutlets

    @IBOutlet weak var authorizedButton: UIButton!    
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    //MARK: - IBActions

}

//MARK: - Bindings
extension AuthorizationController{
    func bind(){
        authorizedButton.reactive.tap
            .replace(with: .completeAuthorization(true))
            .bind(to: action)
        
        cancelButton.reactive.tap
            .replace(with: .completeAuthorization(false))
            .bind(to: action)
    }
}

//MARK: - Helpers
extension AuthorizationController{

}

