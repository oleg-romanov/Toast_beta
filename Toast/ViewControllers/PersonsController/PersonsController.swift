//
//  PersonsController.swift
//  Birthdays
//
//  Created by Олег Романов on 04.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit
import SPAlert

final class PersonsContoller: UIViewController {
    // MARK: - Properties

    var customView: PersonsView = PersonsView()

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        setupStyle()
        addActionHandlers()
        customView.updateData(Person.generateData())
    }

    // MARK: - Init

    private func setupStyle() {
        navigationItem.title = Text.Persons.title
        navigationItem.rightBarButtonItem = customView.addPersonButton
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView.addPersonButton.target = self
        customView.addPersonButton.action = #selector(addPersonButtonClicked)
    }

    @objc private func addPersonButtonClicked() {
        let nextController = AddPersonController()
        nextController.delegate = self
        navigationController?.pushViewController(nextController, animated: true)
    }
}

// MARK: - AddPersonControllerDelegate

extension PersonsContoller: AddPersonControllerDelegate {
    func addPerson(_ person: Person) {
        customView.addPerson(person)
        SPAlert.present(
            title: Text.Persons.done,
            message: "\(person.name)" + Text.Persons.message,
            preset: .done
        )
    }
}
