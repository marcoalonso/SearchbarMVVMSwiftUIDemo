//
//  ContentView.swift
//  SearchbarDemo
//
//  Created by Marco Alonso Rodriguez on 16/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchQuery = ""
    @StateObject private var viewModel = ViewModel()
    

    
    var body: some View {
        NavigationView {
            List(viewModel.filteredUsers) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.black)
                            .clipShape(Circle())
                            
                        
                        VStack {
                            Text(user.name)
                                .font(.title2)
                            Text(user.email)
                                .font(.title3)
                        }
                    }
                }

            }
            .searchable(text: $searchQuery, prompt: "Search user")
            .onChange(of: searchQuery, perform: { query in
                viewModel.filterUsers(query: query)
            })
            .navigationTitle("Users")
        }
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
