//
//  TweetCell.swift
//  Twitter
//
//  Created by Jeffy Touth on 4/19/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetButton: UIButton! //refers to fav button. need to refactor
    @IBOutlet weak var favoriteButton: UIButton! // refers to retweet button. need to refactor
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (error) in
                print("Favorited didn't succeed. \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (error) in
                print("Unfav failed \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Retweet Error: \(error)")
        })
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            favoriteButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            favoriteButton.isEnabled = false
        } else{
            favoriteButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            favoriteButton.isEnabled = true
        }
    }
    
    func setFavorited(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            retweetButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal) // Change to favButton after refactor
        }
        else{
            retweetButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal) // Change to favButton after refactor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
