//
//  MainViewController.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/17.
//

import UIKit
import Integration
import NetworkTool

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "哈哈"
        
        self.view.backgroundColor = .white
        NetworkTool.testTool()
        NetworkTool.testHappy()
    }
    

}
