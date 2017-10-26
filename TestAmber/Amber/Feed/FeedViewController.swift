//
//  FeedFeedViewController.swift
//  TestAmber
//
//  Created by Nikita Arkhipov on 11/10/2017.
//  Copyright © 2017 Anvics. All rights reserved.
//

import UIKit
import Bond
import Amber

let FeedModule = FeedController.self
final class FeedController: UIViewController, AmberController {

    let store = AmberStore(reducer: FeedReducer(), router: FeedRouter())

    static let storyboardFile = "Main"
    static let storyboardID = "FeedController"

    //MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileButton: UIBarButtonItem!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        tableView.tableFooterView = UIView()
    }

    //MARK: - IBActions

}

//MARK: - Bindings
extension FeedController{
    func bind(){
        profileButton.reactive.tap
            .replace(with: FeedTransition.profile)
            .bind(to: transition)
        
        state.map { $0.isLoading }.bind(to: activityIndicator.reactive.isAnimating)
        
        state.map { $0.feedItems }.bind(to: tableView) {
            [unowned self] (items, ip, tv) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "FeedTableViewCell")
                as! FeedTableViewCell
            
            let item = items[ip.row]
            cell.reactive.bag.dispose()
            
            cell.postImageView.image = item.image
            cell.postTitle.text = item.title
            cell.likeButton.setTitle(item.isLiked ? "Unlike" : "Like", for: .normal)
            
            cell.likeButton.reactive.tap
                .replace(with: FeedAction.like(ip.row + 1))
                .bind(to: self.action)
                .dispose(in: cell.reactive.bag)
            
            return cell
        }
    }
}

//MARK: - Helpers
extension FeedController{

}

extension FeedController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let image = store.currentState().feedItems[indexPath.row].image{
            store.perform(transition: .showPhoto(image))
        }
    }
}
