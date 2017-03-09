//
//  ViewController.swift
//  SplitViewControllerSample
//
//  Created by Yuya Hirayama on 2017/03/10.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import UIKit
import SplitViewController
import SafariServices

class ViewController: UIViewController {

  @IBAction func buttonDidTap(_ sender: Any) {
    let upperVC = SFSafariViewController.init(url: URL.init(string: "https://retrip.jp/articles/78810/")!)
    let lowerVC = UIViewController.init()
    lowerVC.view.backgroundColor = UIColor.cyan
    let splitVC = SplitViewController.init(upperViewController: upperVC, lowerViewController: lowerVC)
    self.present(splitVC, animated: true, completion: nil)
  }

}

