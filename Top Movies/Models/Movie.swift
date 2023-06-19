//
//  Movie.swift
//  Top Movies
//
//  Created by Mubeen Riaz on 15/06/2023.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift


class Movie: Object {
    @Persisted var category: String? = ""
    @Persisted var imageUrl: String? = ""
    @Persisted var name: String? = ""
    @Persisted var desc: String? = ""
    
    convenience init(category: String, imageUrl: String, name: String, desc: String) {
           self.init()
           self.category = category
           self.imageUrl = imageUrl
           self.name = name
           self.desc = desc
       }
}
