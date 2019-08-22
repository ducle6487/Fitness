//
//  PhongTapUtils.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/3/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit
import CoreData

class PhongTapUtils: NSObject {

    var context: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext) {
        self.context = context
        super.init()
        //init data
        self.initPhongTap()
    }
    
    func initPhongTap() {
        if getAllPhongTap().count == 0{
            themPhongTap(id: 1, image: "gym1", name: "UFC Gym Việt Nam", diachi: "Floor 3 - Thao Dien Pearl, 12 Quốc Hương, Thảo Điền, Quận 2, Hồ Chí Minh", gioopen: "06:00–23:00", danhgia: 4.5, mota: "", lat: 10.801658, long: 106.732927, phone: "+84 1800 6995")
            themPhongTap(id: 2, image: "gym2", name: "Dzô Gym", diachi: "29 Đường số 5, Hiệp Bình Chánh, Thủ Đức, Hồ Chí Minh, Việt Nam", gioopen: "05:30–21:00", danhgia: 5.0, mota: "", lat: 10.829738, long: 106.712494, phone: "+84 96 777 71 33")
            themPhongTap(id: 3, image: "gym3", name: "GYM HCA", diachi: "324 CHU VĂN AN P.12 Q.BÌNH THẠNH, Phường 12, Bình Thạnh, Hồ Chí Minh", gioopen: "05:00–22:00", danhgia: 4.8, mota: "", lat: 10.811349, long: 106.703718, phone: "+84 91 475 07 33")
            themPhongTap(id: 4, image: "gym4", name: "Gym Sông Đà 2", diachi: "19 Đường số 8, Hiệp Bình Chánh, Thủ Đức, Hồ Chí Minh", gioopen: "06:00", danhgia: 4.6, mota: "", lat: 10.830951, long: 106.715953, phone: "+84 98 478 95 94")
            themPhongTap(id: 5, image: "gym5", name: "B GYm", diachi: "48 Số 23, Hiệp Bình Chánh, Thủ Đức, Hồ Chí Minh", gioopen: "05:00–21:00", danhgia: 3.4, mota: "", lat: 10.827377, long: 106.727856, phone: "+84 93 214 03 92")
            themPhongTap(id: 6, image: "gym6", name: "California Fitness Center ", diachi: "Saigon Mall, Phường 10, Quận Gò Vấp, Tp. Hồ Chí Minh", gioopen: "06:00–23:00", danhgia: 3.7, mota: "", lat: 10.774453, long: 106.688324, phone: "+84 28 7309 7999")
        }
    }
    
    func themPhongTap(id: Int, image: String, name: String, diachi: String, gioopen: String, danhgia: Float, mota: String, lat: Double, long: Double, phone: String) -> Bool{
        
        var result = false
        let phongTap = PhongTap(context: context)
        phongTap.id = Int16(id)
        phongTap.address = diachi
        phongTap.danhgia = danhgia
        phongTap.image = image
        phongTap.lat = lat
        phongTap.timeopen = gioopen
        phongTap.long = long
        phongTap.mota = mota
        phongTap.name = name
        phongTap.save(success: {
            result = false
        }) { (Error) in
            print("\(Error)")
            result = true
        }
        return result
    }
    
    func getAllPhongTap() -> [PhongTap]{
        var result = [PhongTap]()
        PhongTap.all(success: { (data) in
            guard let dataPhongTap = data as? [PhongTap] else {
                print("can't as")
                return
            }
            result = dataPhongTap
        }, fail: nil)
        return result
    }
    
    func xepLoai(diem:Float) -> UIImage{
        if(diem>0 && diem<2){
            return UIImage(named: "v1")!
        }else if(diem>=2 && diem<4){
            return UIImage(named: "v2")!
        }else if(diem>=4 && diem<=5){
            return UIImage.init(named: "v3")!
        }
        return UIImage()
    }
    
}
