//
//  Person.swift
//  Homework-4.1.LoginAppMVC
//
//  Created by Александр Холод on 01.02.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person

    static func getUserData() -> User {
        User(
            login: "Alex",
            password: "1234",
            person: Person.getUser()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: String

    var fullname: String {
        "\(name) \(surname)"
    }

    static func getUser() -> Person {
        Person(name: "Alex", surname: "Holod", age: "23")
    }
}

