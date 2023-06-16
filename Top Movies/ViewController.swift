//
//  ViewController.swift
//  Top Movies
//
//  Created by Mobeen Riaz on 14/06/2023.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    private let apiUrl = "https://howtodoandroid.com/movielist.json"
    private var moviesList = [Movie]()
    
    @IBOutlet var moviesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        loadMoviesFromApi()
        print("test branch")
    }
    
    func initCollectionView(){
        moviesCV.delegate = self
        moviesCV.dataSource = self
        moviesCV.register(UINib(nibName: "MovieCVC", bundle: nil), forCellWithReuseIdentifier: MovieCVC.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing  = 4
        moviesCV.setCollectionViewLayout(layout, animated: true)
    }
    
    func loadMoviesFromApi(){
        Alamofire.request(apiUrl,
                          method: .get,
                          encoding: JSONEncoding.default).responseJSON { response in
            if response.result.isSuccess {
                let moviesDict  = response.value as! [NSDictionary]
                var movie = Movie()
                for list in moviesDict {
                    movie.name = list["name"] as? String
                    movie.imageUrl = list["imageUrl"] as? String
                    movie.desc = list["desc"] as? String
                    self.moviesList.append(movie)
                }
                self.moviesCV.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = moviesCV.dequeueReusableCell(withReuseIdentifier: MovieCVC.identifier, for: indexPath) as! MovieCVC
        cell.setData(self.moviesList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: widthPerItem * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieViewController(nibName: "MovieViewController", bundle: nil)
        vc.movie = moviesList[indexPath.row]
        self.present(vc, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
}

