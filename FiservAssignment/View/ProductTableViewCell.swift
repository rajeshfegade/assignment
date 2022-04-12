//
//  ProductTableViewCell.swift
//  FiservAssignment
//
//Created by Appleon 12/04/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.productImageView.contentMode = .scaleAspectFit
    }

    func configureCell(productDetails: ProductListModel) {
        self.titleLabel.text = productDetails.title
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.categoryLabel.text = productDetails.category
        self.PriceLabel.text = String(format:"$%.2f", productDetails.price)
        self.PriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        if let url = URL(string: productDetails.image ?? "") {
            self.productImageView.loadImage(url)
        }
    }


}
