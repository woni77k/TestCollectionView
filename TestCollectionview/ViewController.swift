//
//  ViewController.swift
//  TestCollectionview
//
//  Created by SEUNG-WON KIM on 2019/12/14.
//  Copyright © 2019 SEUNG-WON KIM. All rights reserved.
//

import UIKit

struct Item {
  let image: String
  let title: String
}

class ViewController: UIViewController {

  let spacing = 8

  let items = [Item(image: "AAA", title: "これはわかりませんでした"),
               Item(image: "BBB", title: "これはわかりませんでした。知るもんかよ"),
               Item(image: "CCC", title: "これはわかりませんでしたがおそらくわかる可能性があるかもよ")]

  private lazy var collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumLineSpacing = CGFloat(spacing)

    let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.backgroundColor = .clear
    cv.delegate = self
    cv.dataSource = self
    cv.register(CustomCell.self, forCellWithReuseIdentifier: "cellId")
    cv.isScrollEnabled = false
    return cv
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(collectionView)

    NSLayoutConstraint.activate([
      collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
      collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 2/3)
    ])
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CustomCell
    cell.configure(items[indexPath.row])

    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let w = (collectionView.frame.width - CGFloat(spacing * (items.count - 1))) / 3
    return CGSize(width: w, height: collectionView.frame.height)
  }
}
