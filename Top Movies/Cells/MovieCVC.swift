//
//  MovieCVC.swift
//  Top Movies
//
//  Created by Mubeen Riaz on 15/06/2023.
//

import UIKit
import SDWebImage

class MovieCVC: UICollectionViewCell {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var imgThumb: UIImageView!

    static let identifier = "MovieCellIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ movie: Movie){
        lblName.text = movie.name
        imgThumb.sd_setImage(with: URL(string: movie.imageUrl ?? ""), placeholderImage: nil)
    }

}
