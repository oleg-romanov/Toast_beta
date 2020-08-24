//
//  TableModel.swift
//  Birthdays
//
//  Created by Олег Романов on 04.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

struct Person {
    // MARK: - Properties

    var name: String
    var birthdate: Date?
    var category: String

    // MARK: - Static

    static func generateData() -> [Person] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"

        let person1 = Person(
            name: "Михаил",
            birthdate: dateFormatter.date(from: "25.03.1997"),
            category: "Друзья"
        )
        let person2 = Person(
            name: "Дмитрий",
            birthdate: dateFormatter.date(from: "11.03.1999"),
            category: "Друзья"
        )
        let person3 = Person(
            name: "Валерия",
            birthdate: dateFormatter.date(from: "05.04.1997"),
            category: "Друзья"
        )
        let person4 = Person(
            name: "Олег",
            birthdate: dateFormatter.date(from: "30.03.2001"),
            category: "Коллеги"
        )
        let person5 = Person(
            name: "Айдар",
            birthdate: dateFormatter.date(from: "04.12.1998"),
            category: "Друзья"
        )

        return [person1, person2, person3, person4, person5]
    }
}
