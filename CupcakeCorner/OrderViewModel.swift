//
//  OrderViewModel.swift
//  CupcakeCorner
//
//  Created by FABRICIO ALVARENGA on 23/08/22.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var order = OrderDataModel()
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var hasInvalidAddress: Bool {
        (order.name.trim().isEmpty ||
         order.streetAddress.trim().isEmpty ||
         order.city.trim().isEmpty ||
         order.zip.trim().isEmpty)
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(order.quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(order.type) / 2)
        
        // $1/cake for extra frosting
        if order.extraFrosting {
            cost += Double(order.quantity)
        }
        
        // $0.50/cake for sprinkles
        if order.addSprinkles {
            cost += Double(order.quantity) / 2
        }
        
        return cost
    }
}
