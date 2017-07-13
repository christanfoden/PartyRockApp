//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Christan on 08/07/2017.
//  Copyright © 2017 Christan. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewimage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewimage.image = UIImage(data: data)
                }
            } catch {
                //handle the error
            }
        }
        
    }
    
}
