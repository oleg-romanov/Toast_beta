//
//  AddPersonController.swift
//  Birthdays
//
//  Created by Олег Романов on 19.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

protocol AddPersonControllerDelegate: AnyObject {
    func addPerson(_ person: Person)
}

class AddPersonController: UIViewController {
    lazy var custonView: AddPersonView? = view as? AddPersonView
    weak var delegate: AddPersonControllerDelegate?

    init() {
        super.init(nibName: "AddPersonView", bundle: Bundle(for: AddPersonView.self))
        setupStyle()
        addActionHandlers()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = Text.AddPerson.add
        navigationItem.rightBarButtonItem = custonView?.doneButton
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        custonView?.doneButton.target = self
        custonView?.doneButton.action = #selector(doneBottonClicked)
    }

    @objc private func doneBottonClicked() {
        guard
            let name = custonView?.nameTextField.text,
            let birthdate = custonView?.datePicker.date,
            name.isEmpty == false
        else { return }
        let newPerson = Person(name: name, birthdate: birthdate, category: "none")
        delegate?.addPerson(newPerson)
        navigationController?.popViewController(animated: true)
    }
}
