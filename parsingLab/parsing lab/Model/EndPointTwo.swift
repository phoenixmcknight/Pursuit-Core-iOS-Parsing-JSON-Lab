//
//  EndPointTwo.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit



struct Colors:Codable {
    let colors:[EndPointTwo]
    
    enum JSONEError: Error {
        case decodingError(Error)
    }
    static func getData(from data:Data) throws -> [EndPointTwo] {
        do {
            
            let colors = try JSONDecoder().decode(Colors.self, from: data)
            return colors.colors
        } catch {
            throw JSONEError.decodingError(error)
        }
        
        
    }
}

struct EndPointTwo:Codable {
    
    let hex:Hex
    let rgb:Fraction
    let name:ColorName
    
   

}
struct ColorName:Codable {
    let value:String
}
struct Hex:Codable {
    let value:String
    let clean:String
    
    

}
struct Fraction:Codable {
    let fraction:RGB
}
struct RGB:Codable {
    let r:Double
    let g:Double
    let b:Double
    func returnUIColor() -> UIColor {
        return UIColor(red: CGFloat(self.r), green: CGFloat(self.g), blue: CGFloat(self.b), alpha: 1.0)
    }
}
