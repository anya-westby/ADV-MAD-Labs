//
//  Animal.swift
//  Lab5
//
//  Created by Anya Westby on 2/28/22.
//

import Foundation

struct Animal: Decodable{
    let name: String
    let latin_name: String
    let image_link: String
}

struct AnimalData: Decodable{
    var animals = [Animal]()
}
