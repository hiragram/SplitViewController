//
//  SplitViewController.swift
//  SplitViewController
//
//  Created by Yuya Hirayama on 2017/03/10.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import UIKit

public class SplitViewController: UIViewController {

  @IBOutlet private weak var upperContainer: UIView!

  @IBOutlet private weak var lowerContainer: UIView!

  @IBOutlet private weak var slider: UIView! {
    didSet {
      let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(sliderDidDrag(gesture:)))
      slider.addGestureRecognizer(gesture)
    }
  }

  @IBOutlet private weak var upperContainerHeight: NSLayoutConstraint!

  private let upperVC: UIViewController
  private let lowerVC: UIViewController

  private var constraintsAdded = false

  public init(upperViewController: UIViewController, lowerViewController: UIViewController) {
    upperVC = upperViewController
    lowerVC = lowerViewController
    super.init(nibName: "SplitViewController", bundle: Bundle.init(for: SplitViewController.self))
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  public override func loadView() {
    super.loadView()
    upperContainer.addSubview(upperVC.view)
    lowerContainer.addSubview(lowerVC.view)

    upperVC.view.translatesAutoresizingMaskIntoConstraints = false
    lowerVC.view.translatesAutoresizingMaskIntoConstraints = false
  }

  public override func updateViewConstraints() {
    super.updateViewConstraints()

    let upperTop = NSLayoutConstraint.init(item: upperVC.view, attribute: .top, relatedBy: .equal, toItem: upperContainer, attribute: .top, multiplier: 1, constant: 0)
    let upperBottom = NSLayoutConstraint.init(item: upperVC.view, attribute: .bottom, relatedBy: .equal, toItem: upperContainer, attribute: .bottom, multiplier: 1, constant: 0)
    let upperLeading = NSLayoutConstraint.init(item: upperVC.view, attribute: .leading, relatedBy: .equal, toItem: upperContainer, attribute: .leading, multiplier: 1, constant: 0)
    let upperTrailing = NSLayoutConstraint.init(item: upperVC.view, attribute: .trailing, relatedBy: .equal, toItem: upperContainer, attribute: .trailing, multiplier: 1, constant: 0)
    upperContainer.addConstraints([upperTop, upperBottom, upperLeading, upperTrailing])

    let lowerTop = NSLayoutConstraint.init(item: lowerVC.view, attribute: .top, relatedBy: .equal, toItem: lowerContainer, attribute: .top, multiplier: 1, constant: 0)
    let lowerBottom = NSLayoutConstraint.init(item: lowerVC.view, attribute: .bottom, relatedBy: .equal, toItem: lowerContainer, attribute: .bottom, multiplier: 1, constant: 0)
    let lowerLeading = NSLayoutConstraint.init(item: lowerVC.view, attribute: .leading, relatedBy: .equal, toItem: lowerContainer, attribute: .leading, multiplier: 1, constant: 0)
    let lowerTrailing = NSLayoutConstraint.init(item: lowerVC.view, attribute: .trailing, relatedBy: .equal, toItem: lowerContainer, attribute: .trailing, multiplier: 1, constant: 0)
    lowerContainer.addConstraints([lowerTop, lowerBottom, lowerLeading, lowerTrailing])

  }

  func sliderDidDrag(gesture: UIPanGestureRecognizer) {
    let height = view.bounds.height
    let point = gesture.location(in: view)

    guard point.y > height * 0.1 else {
      return
    }

    guard point.y < height * 0.9 else {
      return
    }

    upperContainerHeight.constant = point.y
    view.setNeedsLayout()
  }
}
