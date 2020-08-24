//
//  PersonsView.swift
//  Birthdays
//
//  Created by Олег Романов on 04.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

final class PersonsView: UIView {
    struct Appearance {
        static let tableHeight = 404
    }

    // MARK: - Properties

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.tableFooterView = UIView()
        return tableView
    }()

    lazy var addPersonButton: UIBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .add, target: nil, action: nil
    )

    private var dataSource: PersonsDataSource = PersonsDataSource()

    // MARK: - Init

    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = Assets.background1.color
        dataSource.setTableView(tableView)
    }

    private func addSubviews() {
        addSubview(tableView)
    }

    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - Internal Methods

    func addPerson(_ person: Person) {
        dataSource.addPerson(person)
    }

    func updateData(_ data: [Person]) {
        dataSource.updateData(data)
    }
}
