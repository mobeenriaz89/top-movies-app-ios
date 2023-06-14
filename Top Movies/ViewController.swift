//
//  ViewController.swift
//  Top Movies
//
//  Created by Mobeen Riaz on 14/06/2023.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://howtodoandroid.com/movielist.json").response { response in
                    debugPrint(response)
                }
        
    }


}

