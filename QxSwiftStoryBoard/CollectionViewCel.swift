//
//  CollectionViewCel.swift
//  QxSwiftStoryBoard
//
//  Created by 新然 on 17/3/1.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

import UIKit

class CollectionViewCel: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    

    @IBOutlet weak var lable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor=UIColor(red: 23/255, green: 232/255, blue: 233/255, alpha: 1)
    }

}
