//
//  CheckStyleCell.swift
//  TestCollectionview
//
//  Created by SEUNG-WON KIM on 2019/12/15.
//  Copyright © 2019 SEUNG-WON KIM. All rights reserved.
//

import UIKit

final class CustomCell: UICollectionViewCell {
  private let layerView: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .lightGray
    v.alpha = 0.3
    v.isHidden = true
    return v
  }()

  private let imageView: UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFit
    return iv
  }()

  private lazy var containerView: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.addSubview(titleLabel)

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: v.topAnchor, constant: 8),
      titleLabel.leftAnchor.constraint(equalTo: v.leftAnchor, constant: 5),
      titleLabel.rightAnchor.constraint(equalTo: v.rightAnchor, constant: -5),
      titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: v.bottomAnchor, constant: -8)
     ])
    return v
  }()

  private let titleLabel: UILabel = {
    let l = UILabel()
    l.translatesAutoresizingMaskIntoConstraints = false
    l.numberOfLines = 0
    return l
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    layer.masksToBounds = true
    layer.cornerRadius = 10
    layer.borderColor = UIColor.gray.cgColor
    layer.borderWidth = 1
    
    setupViews()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var isHighlighted: Bool {
    didSet {
      layerView.isHidden = !isHighlighted
    }
  }
  
  func configure(_ item: Item) {
    imageView.image = UIImage(named: item.image)
    titleLabel.text = item.title
  }
  
  private func setupViews() {
    contentView.addSubview(imageView)
    contentView.addSubview(containerView)
    contentView.addSubview(layerView)
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
      containerView.leftAnchor.constraint(equalTo: leftAnchor),
      containerView.rightAnchor.constraint(equalTo: rightAnchor),
      containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3)
    ])

    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.leftAnchor.constraint(equalTo: leftAnchor),
      imageView.rightAnchor.constraint(equalTo: rightAnchor),
      imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor)
    ])
    
    NSLayoutConstraint.activate([
      layerView.topAnchor.constraint(equalTo: topAnchor),
      layerView.leftAnchor.constraint(equalTo: leftAnchor),
      layerView.rightAnchor.constraint(equalTo: rightAnchor),
      layerView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
