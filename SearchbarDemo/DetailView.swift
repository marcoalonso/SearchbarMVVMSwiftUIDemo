//
//  DetailView.swift
//  SearchbarDemo
//
//  Created by Marco Alonso Rodriguez on 17/06/23.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    @State var user: User
    
    var body: some View {
        VStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("User: \(user.name)")
            Text("User: \(user.email)")
            Text("User: \(user.phone)")
            
            MapView()
                .frame(maxHeight: 400)
                .cornerRadius(20)
            
            Spacer()
        }
        .padding(12)
    }
}

// MARK:  Mapkit View
struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Configuraciones adicionales del mapa (opcional)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: 12, name: "Marco", username: "AlonsoR26", email: "marco@gmail.com", address: Address(street: "street", suite: "suit", city: "morelia", zipcode: "58000", geo: Geo(lat: "12.43", lng: "-102.23")), phone: "44332211", website: "", company:  Company(name: "name", catchPhrase: "", bs: "")))
    }
}
