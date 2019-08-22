//
//  InFoExcerciseViewController.swift
//  Fitness
//
//  Created by Duc'sMacBook on 6/30/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit

class InFoExcerciseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var baiTapList = [BaiTap]()
    var baiTapUtils: BaiTapUtils?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var popularTabVw: UITableView!
    @IBOutlet weak var favoriteTabVw: UIView!
    @IBOutlet weak var recentTabVw: UIView!
    @IBOutlet weak var aToZTabVw: UIView!
    @IBOutlet weak var customTabVw: UIView!
    
    
    let nameTabBar = ["Favorites",
                      "Recent",
                      "Popular",
                      "A-Z",
                      "Custom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //list excercise
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        baiTapUtils = BaiTapUtils.init(context: appDelegate.persistentContainer.viewContext)
        baiTapList = (baiTapUtils?.getAllBaiTap())!
        //
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = view.frame.width / 5
        layout.itemSize = CGSize(width: width, height: 50)
        layout.minimumInteritemSpacing = 0
        searchBar.layer.cornerRadius = 8
        let indexPath = NSIndexPath(item: 2, section: 0) as IndexPath
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init())
        
    }
//collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabcell", for: indexPath) as! TabbarCollectionViewCell
        cell.NameTabLb.text = nameTabBar[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.item == 0){
            favoriteTabVw.isHidden = false
            recentTabVw.isHidden = true
            popularTabVw.isHidden = true
            aToZTabVw.isHidden = true
            customTabVw.isHidden = true
        }else if(indexPath.item == 1){
            favoriteTabVw.isHidden = true
            recentTabVw.isHidden = false
            popularTabVw.isHidden = true
            aToZTabVw.isHidden = true
            customTabVw.isHidden = true
        }else if(indexPath.item == 2){
            favoriteTabVw.isHidden = true
            recentTabVw.isHidden = true
            popularTabVw.isHidden = false
            aToZTabVw.isHidden = true
            customTabVw.isHidden = true
        }else if(indexPath.item == 3){
            favoriteTabVw.isHidden = true
            recentTabVw.isHidden = true
            popularTabVw.isHidden = true
            aToZTabVw.isHidden = false
            customTabVw.isHidden = true
        }else if(indexPath.item == 4){
            favoriteTabVw.isHidden = true
            recentTabVw.isHidden = true
            popularTabVw.isHidden = true
            aToZTabVw.isHidden = true
            customTabVw.isHidden = false
        }
    }
    
//table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baiTapList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = baiTapList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "listcell") as! InfoExcerciseTableViewCell
        cell.ImageImg.image = UIImage.init(named: data.hinhAnh!)
        cell.NameExLb.text = data.ten
        cell.rightImageImg.image = UIImage.init(named: "right")
        cell.ImageImg.layer.cornerRadius = 22
        cell.ImageImg.layer.borderWidth = 0.5
        cell.ImageImg.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = baiTapList[indexPath.row]
        let startExcerciseVC = storyboard?.instantiateViewController(withIdentifier: "startExcercise") as? LetStartExcerciseViewController
        startExcerciseVC!.image = data.hinhAnh!
        startExcerciseVC!.name = data.ten!
        startExcerciseVC!.step = data.huongDan!
        startExcerciseVC!.set = Int(data.reps)
        startExcerciseVC!.restTime = Int(data.timeofrest)
        startExcerciseVC!.setTime = Int(data.timeofrep)
        startExcerciseVC!.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(startExcerciseVC!, animated: true, completion: nil)
    }
    
    @IBAction func BackBt(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func FilterBt(_ sender: Any) {
        
    }
    
  

}

