//
//  DetailedViewControllerEndPointTwo.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit
class DetailedViewControllerEndPointTwo: UIViewController {
    var passingInfo:EndPointTwo!
    @IBOutlet weak var hexName: UILabel!
    @IBOutlet weak var rgbValues: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    

    }
    
    func setup() {
        hexName.text = "Hex Value: \(passingInfo.hex.value)"
        rgbValues.text = """

Values
        R: \(passingInfo.rgb.fraction.r)
        G: \(passingInfo.rgb.fraction.g)
        B: \(passingInfo.rgb.fraction.b)


"""

        view.backgroundColor = passingInfo.rgb.fraction.returnUIColor()
    }
    
}
