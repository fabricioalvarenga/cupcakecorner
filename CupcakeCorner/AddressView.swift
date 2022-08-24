//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by FABRICIO ALVARENGA on 22/08/22.
//

import SwiftUI

struct AddressView: View {
//    @ObservedObject var order: Order
    @ObservedObject var vm: OrderViewModel
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $vm.order.name)
                TextField("Street address", text: $vm.order.streetAddress)
                TextField("City", text: $vm.order.city)
                TextField("Zip", text: $vm.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(vm: vm)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(vm.hasInvalidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(vm: OrderViewModel())
        }
    }
}
