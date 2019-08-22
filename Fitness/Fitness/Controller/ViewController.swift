//
//  ViewController.swift
//  Fitness
//
//  Created by Duc'sMacBook on 6/28/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit

class NhomCoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var nhomCoList = [NhomCo]()
    var nhomCoUtils: NhomCoUtils?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nhomCoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nhomCoData = nhomCoList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "excercise", for: indexPath) as! ExcerciseCollectionViewCell
        cell.imageImg.image = UIImage(named: nhomCoData.image!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let inFoExcerciseVC = storyboard?.instantiateViewController(withIdentifier: "InfoExcercise") as? InFoExcerciseViewController{
            present(inFoExcerciseVC, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        nhomCoUtils = NhomCoUtils(context: appDelegate.persistentContainer.viewContext)
        nhomCoList = nhomCoUtils!.getAllNhomCo()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = self.view.frame.width / 3
        let height = self.collectionView.frame.height / 4
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
    }


}

