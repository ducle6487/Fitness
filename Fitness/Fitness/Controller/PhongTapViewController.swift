

import UIKit
import GoogleMaps

class PhongTapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    var phongTapList = [PhongTap]()
    var phongTapUtils: PhongTapUtils?
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var collectionView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        phongTapUtils = PhongTapUtils(context: (appDelegate.persistentContainer.viewContext))
        phongTapList = phongTapUtils!.getAllPhongTap()
        // add map
        initBanDo()
        loadPhongTapToMap()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phongTapList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let phongTapData = phongTapList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellpt") as? PhongTapTableViewCell
        cell?.tenLb.text = phongTapData.name
        cell?.danhGiaLb.text = "\(phongTapData.danhgia)"
        cell?.diaChiLb.text = phongTapData.address
        cell?.gioMoCuaLb.text = "Giờ mở cửa: \(phongTapData.timeopen ?? "")"
        cell?.imageImg.image = UIImage(named: phongTapData.image ?? "")
        return cell ?? UITableViewCell()
    }
    
    func initBanDo(){
        //let camera = GMSCameraPosition.camera(withLatitude: 10.773075, longitude: 106.689279, zoom: 16)
//        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView?.settings.zoomGestures = true
        mapView?.settings.myLocationButton = true
//        view = mapView
        mapView?.isMyLocationEnabled = true
        // khoi tao bien location manager de lấy vtri nguoi dung
        locationManager = CLLocationManager()
        locationManager?.distanceFilter = 200
        locationManager?.startUpdatingLocation()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.delegate = self
    }
    
    func loadPhongTapToMap(){
        for index in 0..<phongTapList.count{
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: phongTapList[index].lat, longitude: phongTapList[index].long))
            marker.title = phongTapList[index].name
            let kq = phongTapUtils?.xepLoai(diem: phongTapList[index].danhgia)
            marker.icon = kq
            marker.map = mapView
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myLocation:CLLocation = locations.last!
        currentLocation = myLocation
        print("vtri hien tai: \(myLocation)")
        let myCamera = GMSCameraPosition.camera(withLatitude: myLocation.coordinate.latitude, longitude: myLocation.coordinate.longitude, zoom: 16)
        mapView?.animate(to: myCamera)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("ok")
        default:
            print("khong cap quyen")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error \(error)")
    }
    
    @IBAction func swapAct(_ sender: Any) {
        if(mapView.isHidden == true){
            mapView.isHidden = false
            collectionView.isHidden = true
        }else{
            mapView.isHidden = true
            collectionView.isHidden = false
        }
        
    }
    
    
    
}
