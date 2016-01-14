//
//  CollectionViewCell.swift
//  MyCollectionViewDemo
//
//  Created by 曾超 on 16/1/14.
//  Copyright © 2016年 zengchao. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor(red: 23/255, green: 232/255, blue: 233/255, alpha: 1)
    }

}
