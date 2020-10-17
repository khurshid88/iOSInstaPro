//
//  HomeViewController.swift
//  InstaPDP
//
//  Created by KHURSHIDBEK on 2020/09/20.
//  Copyright © 2020 MySoft. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var tableView: UITableView!
     var items : Array<Post> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }


    // MARK: - Method
    
    func initViews(){
        tableView.dataSource = self
        tableView.delegate = self
        
        setNavigationBar()
        
        items.append(Post(fullname: "Sherzod", user_img: "im_person1", post_img: "im_post1"))
        items.append(Post(fullname: "Malika", user_img: "im_person2", post_img: "im_post2"))
    }
    
    func setNavigationBar(){
        let camera = UIImage(named: "ic_camera")
        let send = UIImage(named: "ic_send")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: camera, style: .plain, target: self, action: #selector(leftTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: send, style: .plain, target: self, action: #selector(rightTapped))
        title = "Instagram"
        
    }
    
    // MARK: - Action
    
    @objc func leftTapped(){
        
    }
    
    @objc func rightTapped(){
        
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self, options: nil)?.first as! PostTableViewCell
        
        cell.fullnameLabel.text = item.fullname
        cell.profileImageView.image = UIImage(named: item.user_img!)
        cell.postImageView.image = UIImage(named: item.post_img!)
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
}
