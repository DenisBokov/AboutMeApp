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
    
    static func getPerson() -> Person {
        Person(
            firstName: "Денис",
            lastName: "Боков",
            personImage: "",
            description: "Родился 27 июля 87 года в г. Горьком"
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
}
