//
//  ViewModel.swift
//  SearchbarDemo
//
//  Created by Marco Alonso Rodriguez on 17/06/23.
//

import Foundation

class ViewModel: ObservableObject {
 
    @Published var users : ListOfUsers = []
    @Published var filteredUsers: ListOfUsers = []
    
    
    init() {
        Task {
            await getUsers()
        }
    }
    
    func getUsers() async {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let users = try! decoder.decode(ListOfUsers.self, from: data)
        DispatchQueue.main.async {
            self.users = users
            self.filteredUsers = users
        }
    }
    
    func filterUsers(query: String) {
           if query.isEmpty {
               filteredUsers = users
           } else {
               filteredUsers = users.filter { user in
                   user.name.lowercased().contains(query.lowercased())
               }
           }
       }
    
    
}
