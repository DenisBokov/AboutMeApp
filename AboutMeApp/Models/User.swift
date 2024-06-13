//
//  User.swift
//  AuthorizationApp
//
//  Created by Denis Bokov on 06.06.2024.
//

struct User {
    let login: String
    let password: String
    let person: Person?
    
    static func getUser() -> User {
        User(
            login: "Denis",
            password: "112",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let personImage: String
    let description: String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    static func getPerson() -> Person {
        Person(
            firstName: "Денис",
            lastName: "Боков",
            personImage: "",
            description: ""
        )
    }
}
