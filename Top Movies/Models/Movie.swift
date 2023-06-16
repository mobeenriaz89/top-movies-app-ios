//
//  Movie.swift
//  Top Movies
//
//  Created by Mubeen Riaz on 15/06/2023.
//

import Foundation
import SwiftyJSON
import Alamofire

struct Movie {
    var category: String? = ""
    var imageUrl: String? = ""
    var name: String? = ""
    var desc: String? = ""
    
    init(json: JSON?) {
        self.category = json?["category"].string
        self.category = json?["imageUrl"].string
        self.category = json?["name"].string
        self.category = json?["desc"].string
    }
    init(){}
}
