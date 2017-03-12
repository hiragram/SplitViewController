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
    let upperVC = SFSafariViewController.init(url: URL.init(string: "https://twitter.com/hiragram")!)
    let lowerVC = UIStoryboard.init(name: "TableViewController", bundle: nil).instantiateInitialViewController()!
    let splitVC = SplitViewController.init(upperViewController: upperVC, lowerViewController: lowerVC)
    self.present(splitVC, animated: true, completion: nil)
  }

}
