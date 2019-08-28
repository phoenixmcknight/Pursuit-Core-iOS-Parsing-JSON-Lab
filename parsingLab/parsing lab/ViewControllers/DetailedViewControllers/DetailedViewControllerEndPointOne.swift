//
//  DetailedViewControllerEndPointOne.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit
class DetailedViewControllerEndPointOne: UIViewController {
    var passingInfo:EndPointOne!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var imageViewEndPoint: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    func setUp() {
        currentTemp.text = "Temp: \(passingInfo.main.temp)"
        weatherDescription.text = "Current Weather: \(passingInfo.weather.description)"
        imageViewEndPoint.image = UIImage(named: passingInfo.weather.weatherPic())
        
    }
    
}
