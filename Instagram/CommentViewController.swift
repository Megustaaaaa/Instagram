//
//  CommentViewController.swift
//  Instagram
//
//  Created by meg on 2017/09/11.
//  Copyright © 2017年 megusta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class CommentViewController: UIViewController {
    
     var postData: PostData? = nil
    
    
    @IBOutlet weak var commentText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentText.text = ""
        
      
    
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func postTappedButton(_ sender: Any) {
        
        
        guard let postData = postData else {
            return
        }
        
        guard let name = Auth.auth().currentUser?.displayName else {
            return
        }
        
        guard let comment = commentText.text else {
            return
        }
        
        if comment.isEmpty {
            return
        }
        // 名前とコメントを追加する
        postData.comments.append("\(name): \(comment)")
        
        //Fierbaseに追加する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comments": postData.comments]
        postRef.updateChildValues(comments)
        
        //閉じる
        commentText.resignFirstResponder()
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
  
   
}
