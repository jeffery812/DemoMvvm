//
//  CarTableViewCell.swift
//  DemoMvvm
//
//  Created by Zhihui Tang on 2016-10-12.
//  Copyright © 2016 Zhihui Tang. All rights reserved.
//

import UIKit
import RxSwift

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var carPhotoView: UIImageView!
    @IBOutlet weak var carTitleLabel: UILabel!
    @IBOutlet weak var carPowerLabel: UILabel!
    
    let disposeBag = DisposeBag()
    var carViewModel: CarViewModel? {
        didSet {
            guard let cvm = carViewModel else {
                return
            }
            
            cvm.titleText.bindTo(carTitleLabel.rx_text).addDisposableTo(self.disposeBag)
            cvm.horsepowerText.bindTo(carPowerLabel.rx_text).addDisposableTo(self.disposeBag)
            
            guard let photoURL = cvm.photoURL else {
                return
            }
            
            NSURLSession.sharedSession().rx_data(NSURLRequest(URL: photoURL)).subscribeNext({ (data) in
                dispatch_async(dispatch_get_main_queue(), {
                    self.carPhotoView.image = UIImage(data: data)
                    self.carPhotoView.setNeedsLayout()
                })
            }).addDisposableTo(self.disposeBag)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
