//
//  EndPointOne.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit


struct EndPointOne:Codable {
    let name:String
    let main:Main
    let weather:Weather
    
   
    enum JSONEError: Error {
        case decodingError(Error)
    }
    static func getData(from data:Data) throws -> [EndPointOne] {
        do {
            
            let endpointone = try JSONDecoder().decode([EndPointOne].self, from: data)
            return endpointone
        } catch {
            throw JSONEError.decodingError(error)
        }
        
    }
}
struct Main:Codable {
    let temp:Double
}
struct Weather:Codable {
    let description:String
    var weatherImage:String {
        get {
            return weatherPic()
        }
    }
    func weatherPic() -> String {
        switch description {
        case "rain and drizzle":
            return "rain"
        default:
            return ""
        }
    }
}
