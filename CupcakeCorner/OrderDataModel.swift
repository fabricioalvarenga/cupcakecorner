//
//  OrderDataModel.swift
//  CupcakeCorner
//
//  Created by FABRICIO ALVARENGA on 23/08/22.
//

import Foundation

struct OrderDataModel: Codable {
    var type = 0
    var quantity = 3
    
    var extraFrosting = false
    var addSprinkles = false
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}
