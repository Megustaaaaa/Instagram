//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by meg on 2017/09/07.
//  Copyright © 2017年 megusta. All rights reserved.
//

import UIKit
protocol PostTableViewCellDelegate {
    func commentButtonTapped(_ cell: PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {
   
    var delegate: PostTableViewCellDelegate? = nil
    var indexPath: IndexPath? = nil

    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setPostData(postData: PostData) {
        self.postImageView.image = postData.image
        
        let comments = postData.comments.joined(separator: "\n")
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)\n\(postData.comments)" //改行してコメントを追加
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
        
    }
    @IBAction func commentButtonTapped(_ sender: Any) {
        delegate?.commentButtonTapped(self)
        

    }

}
