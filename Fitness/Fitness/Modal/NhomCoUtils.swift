//
//  NhomCoUtils.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/3/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import Foundation
import CoreData

class NhomCoUtils{
    var context: NSManagedObjectContext!
        init(context: NSManagedObjectContext){
            self.context = context
            initData()
        }
    
    func initData(){
        if(getAllNhomCo().count == 0){
            themNhonCo(ten: "tripceps", hinhAnh: "bp_m_triceps", id: 0)
            themNhonCo(ten: "chest", hinhAnh: "bp_m_chest", id: 1)
            themNhonCo(ten: "shouders", hinhAnh: "bp_m_shoulders", id: 2)
            themNhonCo(ten: "biceps", hinhAnh: "bp_m_biceps", id: 3)
            themNhonCo(ten: "core", hinhAnh: "bp_m_abs", id: 4)
            themNhonCo(ten: "back", hinhAnh: "bp_m_back", id: 5)
            themNhonCo(ten: "forearms", hinhAnh: "bp_m_forearms", id: 6)
            themNhonCo(ten: "upper leg", hinhAnh: "bp_m_thigh", id: 7)
            themNhonCo(ten: "glutes", hinhAnh: "bp_m_glutes", id: 8)
            themNhonCo(ten: "cardio", hinhAnh: "bp_m_cardio", id: 9)
            themNhonCo(ten: "calves", hinhAnh: "bp_m_calves", id: 10)
            themNhonCo(ten: "all", hinhAnh: "bp_m_all", id: 11)
        }
    }
    
    func themNhonCo(ten:String, hinhAnh:String, id: Int) -> Bool{
        var result = false
        let nhomCo = NhomCo(context: context)
        nhomCo.id = Int16(id)
        nhomCo.image = hinhAnh
        nhomCo.name = ten
        nhomCo.save(success: {
            print("add success")
            result = true
        }) { (Error) in
            print("found \(Error)")
            result = false
        }
        return result
    }
    
    func getAllNhomCo() -> [NhomCo]{
        var result = [NhomCo]()
        NhomCo.all(success: { (data) in
            guard let dataNhomCo = data as? [NhomCo] else {
                print("can't as")
                return
            }
            result = dataNhomCo
        }, fail: nil)
        return result
    }
    
    
}
