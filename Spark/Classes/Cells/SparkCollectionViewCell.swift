//
//  SparkCollectionViewCell.swift
//  Spark
//
//  Created by Alex Roman on 3/8/22.
//

import UIKit

class SparkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var createSparkButton: UIButton!
    
    static let identifier = "SparkCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SparkCollectionViewCell", bundle: nil)
    }
    
    public func conifugre(with message: String){
        self.messageLabel.text = message
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
