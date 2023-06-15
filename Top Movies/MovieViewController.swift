//
//  MovieViewController.swift
//  Top Movies
//
//  Created by Mobeen Riaz on 15/06/2023.
//

import UIKit
import SDWebImage

class MovieViewController: UIViewController {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var imgThumb: UIImageView!
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = movie.name
        lblDesc.text = movie.desc
        imgThumb.sd_setImage(with: URL(string: movie.imageUrl ?? ""))
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
