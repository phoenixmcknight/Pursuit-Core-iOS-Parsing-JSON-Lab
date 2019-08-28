//
//  DetailedViewControllerEndpointThree.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit
class DetailedViewControllerEndpointThree: UIViewController {
    var passingInfo:EndPointThree!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUplabels()
        // Do any additional setup after loading the view.
    }
    func setUplabels() {
        phoneNumberLabel.text = "Phone Number: \(passingInfo.phone)"
        addressLabel.text = passingInfo.location.getLocation()
        dateOfBirth.text = "Date of Birth: \(passingInfo.dob.date)"
    }
    
}
