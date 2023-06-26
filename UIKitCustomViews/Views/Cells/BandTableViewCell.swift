//
//  BandDetailTableViewCell.swift
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 16/06/2023.
//

import UIKit

class BandTableViewCell: UITableViewCell {
    
    static let identifier = "BandDetailTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "BandDetailTableViewCell",
                     bundle: nil)
    }
    
    @IBOutlet var bandImageView: UIImageView!
    @IBOutlet var bandNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bandNameLabel = UILabel(frame: CGRect(x: 80, y: 16, width: contentView.frame.size.width - 16, height: 40))
        bandNameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        contentView.addSubview(bandNameLabel)
        
        bandImageView = UIImageView(frame: CGRect(x: 16, y: 14, width: 50, height: 50))
        contentView.addSubview(bandImageView)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
