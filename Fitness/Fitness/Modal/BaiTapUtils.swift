//
//  BaiTapUtils.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/11/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit
import CoreData

class BaiTapUtils: NSObject{
    var context: NSManagedObjectContext!
        init(context: NSManagedObjectContext){
            self.context = context
            super.init()
            self.initData()
        }
    
    func initData(){
        if(getAllBaiTap().count == 0){
            themBaiTap(hinhAnh: "bai1", name: "Barbell Close Grip Bench Press", loaiNhomCo: 0, huongDan: """
1.) Start off lying with your back flat on a bench with your feet flat on the floor in front of you.

2.) Grab the bar with a narrow grip keeping your hands close enough so that your thumbs are able to touch.

3.) Then lift the barbell off of the rack and hold it above your chest as this will be your starting position.

4.) Lower the barbell towards your chest, stopping so that the bar is close to touching you and hold for a second.

5.) Push the bar back up to the starting position and repeat for as many reps and sets as desired.
""", moTa: "", tips: "", rep: 3, timerest: 10, timerep: 60)
            themBaiTap(hinhAnh: "bai2", name: "Barbell Incline Close Grip Bench Press", loaiNhomCo: 0, huongDan: """
1.) Start off laying back on an incline bench press with your feet flat on the floor in front of you, grabbing the barbell with a close overhand grip.

2.) Remove the barbell from the rack and elevate it over your chest.

3.) Keep your elbows tucked in at your sides and lower the barbell down to your middle chest without touching.

4.0 Squeeze your triceps and hold for a count.

5.) Return back to the starting position.

6.) Repeat for as many reps and sets as desired.
""", moTa: "", tips: "", rep: 5, timerest: 5, timerep: 45)
            themBaiTap(hinhAnh: "bai3", name: "1 Leg Pushup", loaiNhomCo: 1, huongDan: """
1.) Start off by getting yourself into a pushup position with arms shoulder width apart and feet extended behind you with toes flat on the floor.

2.) Take one leg and place it over the other so that only one foot is positioned on the floor.

3.) Slowly lower yourself down until your chest almost touches the floor then hold for a count.

4.) Return back to the starting position.

5.) Repeat for as many reps and sets as desired.
""", moTa: "", tips: "", rep: 4, timerest: 5, timerep: 60)
            themBaiTap(hinhAnh: "bai4", name: "Barbell Bench Press", loaiNhomCo: 1, huongDan: """
1.) Lie with your back flat on a bench with your feet firmly on the ground and the bar resting on the bench’s rack.

2.) Slowly lift the bar off the rack and hold it above your chest as this will be the starting position.

3.) Then lower the bar down until it is slightly above your chest, making sure that it doesn't touch or slam against your chest.

4.) Hold this position briefly and make sure you have complete control of the bar, then raise it back up to the starting postion.

3.) Place the bar on the rack and that will complete your set.
""", moTa: "", tips: "", rep: 2, timerest: 10, timerep: 75)
            themBaiTap(hinhAnh: "bai5", name: "Barbell Bradford Rocky Press", loaiNhomCo: 2, huongDan: """
1.) To begin this exercise; start off sitting on a straight up military press bench with a weighted barbell rested upon your upper chest.

2.) Keeping your palms face out push the barbell up in an overhead press above your head and hold for a few seconds.

3.) Then lower the bar down behind the back of your head and hold for a few seconds.

4.) Return back to the overhead position and then back to the starting position.

5.) Repeat this exercise for as many repetitions as needed.
""", moTa: "", tips: "", rep: 3, timerest: 8, timerep: 45)
            themBaiTap(hinhAnh: "bai6", name: "Barbell Clean and Jerk", loaiNhomCo: 2, huongDan: """
1.) To begin this exercise; start off with a weighted barbell in front of your feet and raise it slightly so that it is parallel with your shins.

2.) Lower your hips and bend your knees a bit while keeping your back straight so that the weight of the bar is rested upon your heels

3.) Pull up on the bar so that it reaches the mid-thigh position then perform a jumping movement, which you extend your knees and hips allowing the bar to move upward.

4.) Keep the bar pressed up and rested against your palms and shoulders.

5.) Then while in a full squat position push your torso upward thrusting with your hips, quads and heels keeping your knees bent slightly and straighten out your back.

6.) With the barbell pressed up overhead, spread your legs out with one leg stretched out a bit forward and the other pushed back slightly maintaining the clean press overhead.

7.) Hold onto this position for a few seconds.

8.) Return back to the starting position by letting the barbell roll down off of your shoulders and lightly bring it back down to the floor.

9.) Repeat this exercise for as many repetitions as needed
""", moTa: "", tips: "", rep: 4, timerest: 5, timerep: 30)
            themBaiTap(hinhAnh: "bai7", name: "Barbell Body Row", loaiNhomCo: 3, huongDan: """
1.) Lie under a bar so that the bar is at mid chest level and your feet are firmly on the floor.

1.) Start off lying under a bar so that it is aligned at mid chest level and your feet are positioned firmly on the floor in front of you.

2.) While keeping your abs drawn tightly in and your back flat, use your arms and row your body up towards the bar until you start to feel a stretch in your chest.

3.) Hold this position for a count then slowly return back to the start in a controlled motion.

4.) Repeat for as many reps and sets as desired.
""", moTa: "", tips: "", rep: 3, timerest: 5, timerep: 50)
            themBaiTap(hinhAnh: "bai8", name: "Barbell Close Grip Preacher Curl", loaiNhomCo: 3, huongDan: """
1.) Start off setting up either weighted barbell or EZ bar with the weight that you would like to use to perform this exercise.

2.) Then sit down on the bench with your feet flat on the floor and arms extended out grabbing onto the bar with a close underhand grip.

3.) Slowly curl the bar up towards your shoulders, isolating and squeezing your shoulders, and hold for a count.

4.) Return back to the starting position.

5.) Repeat for as many reps and sets as desired.
""", moTa: "", tips: "", rep: 3, timerest: 5, timerep: 45)
            themBaiTap(hinhAnh: "bai9", name: "Ab Crunch Machine", loaiNhomCo: 4, huongDan: """
1.) Sit down in the machine and select a resistance that is with-in safe limits of your ability.

2.) Do a crunch in a slow controlled manner while slowly breathing out.

3.) Pause at the bottom of your crunch for 3 seconds.

4.) Return to your starting position in a slow controlled movement.
""", moTa: "", tips: "", rep: 2, timerest: 5, timerep: 60)
            themBaiTap(hinhAnh: "bai10", name: "Ab Draw Leg Slide", loaiNhomCo: 4, huongDan: """
1.) Start off laying on your back with your knees bent at 90 degrees and keeping your arms at your sides, palms up.

2.) Maintaining slight pressure on your hands, extend your legs slowly forward so that you feel a stretch and squeeze on your abdominals.

3.) Return back to the starting position and repeat for as many reps and sets desired.
""", moTa: "", tips: "", rep: 3, timerest: 5, timerep: 50)
            themBaiTap(hinhAnh: "bai11", name: "Back Extension on Exercise Ball", loaiNhomCo: 5, huongDan: """
1.) Start off lying prone on a stability ball with your toes planted firmly on the floor to help provide balance on the ball.

2.) With your hands across your chest or at your ears, raise your chest off the ball so you are hyper-extending your spine.

3.) Slowly return your chest to the ball.

4.) Repeat for as many reps and sets as desired.
""", moTa: "", tips: "", rep: 5, timerest: 10, timerep: 30)
            themBaiTap(hinhAnh: "bai12", name: "Back Relaxation", loaiNhomCo: 5, huongDan: """
1.) Take an exercise ball and lie face up on it with your knees bent and feet on the floor.

2.) Extend your body and relax your back on the ball, easing your arms behind your head.

3.) Hold this position for 5 to 10 minutes to allow your muscles to relax and stretch.

4.) Return back to the starting position.
""", moTa: "", tips: "", rep: 4, timerest: 5, timerep: 50)
            themBaiTap(hinhAnh: "bai13", name: "Barbell Reverse Preacher Curls", loaiNhomCo: 6, huongDan: """
1.) Sit on preacher bench placing back of arms on pad.

2.) Grasp curl bar with shoulder width overhand grip.

3.) Raise bar until forearms are vertical.

4.) Lower barbell until arm is fully extended.

5.) Repeat for the desired amount of reps.
""", moTa: "", tips: "", rep: 3, timerest: 10, timerep: 70)
            themBaiTap(hinhAnh: "bai14", name: "Barbell Reverse Curl", loaiNhomCo: 6, huongDan: """
1.) Stand with your feet shoulders width apart.

2.) Bending at the knees pick up barbell.

3.) With your palms facing downward lift the barbell to your chest while remaining up straight.

4.) Do not bend your upper arms but bend only at your elbows, with your forearms moving.

5.) Keep your wrist straight while raising and lowering the barbell.

6.) Repeat for the desired amount of reps.

7.) After the set bend at your knees to set the barbell down.
""", moTa: "", tips: "", rep: 3, timerest: 10, timerep: 65)
            themBaiTap(hinhAnh: "bai15", name: "90 90 Hamstring", loaiNhomCo: 7, huongDan: """
1.) To begin this exercise; start off lying flat on your back with one leg extended out and with your other leg bend it and grab the knee with your hands.

2.) Take the leg that is being bent and extend it straight into the air and hold onto the position for up to 15 seconds and then alternate legs.

3.) Repeat this exercise for as many repetitions as needed
""", moTa: "", tips: "", rep: 3, timerest: 5, timerep: 60)
            themBaiTap(hinhAnh: "bai16", name: "Barbell 1/2 Squat", loaiNhomCo: 7, huongDan: """
1.) Start off setting up a weighted barbell with the amount of weight that you would like to perform.

2.) Position the barbell on your shoulders with an overhand wide shoulder width grip just as in a regular squat position.

3.) Slowly squat down towards the floor about 12 inches, not as much as a regular squat, and hold for a count.

4.) Return back up to the starting position.

5.) Repeat for as many reps and sets as desired.
""", moTa: "", tips: "", rep: 4, timerest: 5, timerep: 45)
            themBaiTap(hinhAnh: "bai17", name: "Ankle On The Knee", loaiNhomCo: 8, huongDan: """
1.) To begin this exercise; start off flat on your back in a lying position with knees bent and feet flat on the floor.

2.) Take your ankle and place in on your opposite knee.

3.) With the bottom leg, grab the knee and pull both of your legs as close to your chest as possible and hold for up to 15 seconds.

4.) Repeat this exercise for as many repetitions as needed.
""", moTa: "", tips: "", rep: 3, timerest: 5, timerep: 30)
            themBaiTap(hinhAnh: "bai18", name: "Barbell Glute Bridge", loaiNhomCo: 8, huongDan: """
1.) To begin this exercise; start off with your back flat on the floor and a weighted barbell above your legs.

2.) Roll the bar so that it is resting above your hips.

3.) With the bar upon your hips, extend upward with your back and heels supporting the weight of the bar.

4.) Push the bar up as high a possible then return back to the starting position.

5.) Repeat this exercise for as many repetitions as needed.
""", moTa: "", tips: "", rep: 3, timerest: 10, timerep: 50)
            themBaiTap(hinhAnh: "bai19", name: "Boxing", loaiNhomCo: 9, huongDan: """
Boxing is a combat sport in which two people fight one another with their fists, it is a great exercise that helps increase stamina, agility and strength while also helping you lose weight and tone your body.
""", moTa: "", tips: "", rep: 10, timerest: 30, timerep: 120)
            themBaiTap(hinhAnh: "bai20", name: "Aerobics", loaiNhomCo: 9, huongDan: """
Aerobic Exercise focuses upon cardiovascular fitness, muscle strength and endurance by performing aerobic workouts.
""", moTa: "", tips: "", rep: 12, timerest: 45, timerep: 150)
            themBaiTap(hinhAnh: "bai21", name: "Ankle Circles", loaiNhomCo: 10, huongDan: """
1.) Start off standing on one foot near a chair or wall for support.

2.) Lift your foot off the ground and draw circles clockwise in the air with your toes.

3.) Reverse the direction (counter-clockwise) and switch feet.
""", moTa: "", tips: "", rep: 3, timerest: 10, timerep: 60)
            themBaiTap(hinhAnh: "bai22", name: "Band Calf Raise", loaiNhomCo: 10, huongDan: """
1.) To begin this exercise; start off with taking an exercise and standing on it with equal amount of band on both sides.

2.) Taking the handles of the bands, elevate your arms towards the side of your head so that the bands tighten up.

3.) Then while leaving your hands by your head, stand on your toes and squeeze tightly on your calves.

4.) After holding on for a few seconds, release and go back to the starting position with your hands still by your head.

5.) Repeat this exercise for as many repetitions as needed
""", moTa: "", tips: "", rep: 3, timerest: 10, timerep: 60)
            
        }
    }
    
    
    func themBaiTap(hinhAnh:String, name:String, loaiNhomCo:Int, huongDan: String, moTa:String, tips:String,rep:Int, timerest:Int, timerep:Int) -> Bool{
        var result = false
        let baiTap = BaiTap(context: context)
        baiTap.hinhAnh = hinhAnh
        baiTap.ten = name
        baiTap.loaiNhomCo = Int16(loaiNhomCo)
        baiTap.huongDan = huongDan
        baiTap.moTa = moTa
        baiTap.reps = Int16(rep)
        baiTap.timeofrep = Int16(timerep)
        baiTap.timeofrest = Int16(timerest)
        baiTap.save(success: {
            result = true
        }) { (error) in
            print("error: \(error)")
            result = false
        }
        return result
    }
    
    func getAllBaiTap() -> [BaiTap]{
        var result = [BaiTap]()
        BaiTap.all(success: { (data) in
            guard let dataBaiTap = data as? [BaiTap] else {
                print("cannot as")
                return
            }
            result = dataBaiTap
        }, fail: nil)
        return result
    }
}

