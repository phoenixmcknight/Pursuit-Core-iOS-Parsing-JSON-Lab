//
//  EndPointThree.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit

struct EndPointThree:Codable {
    let name:Name
    let email:String
    let location:Location
    let phone:String
    let dob:DOB

    enum JSONEError: Error {
        case decodingError(Error)
    }
   
    static func getData(from data:Data) throws -> [EndPointThree] {
        do {
            
            let endpointthree = try JSONDecoder().decode([EndPointThree].self, from: data)
            return endpointthree
        } catch {
            throw JSONEError.decodingError(error)
        }
        
    }
    
}
struct DOB:Codable {
    let date:String
    
}
struct Name:Codable {
    let title:String
    let first:String
    let last:String
    func getName() -> String {
       return title + " " + first + " " + last
    }
}
struct Location:Codable {
    let street:String
    let city:String
    let state:String
   
    func getLocation() -> String {
        return """

    Address Information
        
State: \(state)
City: \(city)
Street: \(street)

"""
    }
}
