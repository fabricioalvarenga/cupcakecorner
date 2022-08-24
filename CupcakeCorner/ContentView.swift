//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by FABRICIO ALVARENGA on 20/08/22.
//

import SwiftUI

/*class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Paul Hudson"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}*/


struct ContentView: View {
//    @StateObject var order = Order()
    @StateObject var vm = OrderViewModel()
  
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select you cake type", selection: $vm.order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(vm.order.quantity)", value: $vm.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $vm.order.specialRequestEnabled.animation())
                    
                    if vm.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $vm.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $vm.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(vm: vm)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
