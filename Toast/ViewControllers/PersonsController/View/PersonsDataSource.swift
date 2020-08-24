//
//  PersonsDataSource.swift
//  Toast
//
//  Created by Олег Романов on 04.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

final class PersonsDataSource: NSObject {
    // MARK: - Properties

    private var data: [[Person]] = []
    private var tableView: UITableView?

    // MARK: - Internal methods

    func setTableView(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PersonCell.self, forCellReuseIdentifier: "TableCell")
    }

    func updateData(_ data: [Person]) {
        self.data = []
        let groupped = Dictionary(grouping: data, by: { person in
            Calendar.current.component(.month, from: person.birthdate ?? Date())
        })
        groupped.keys.forEach { [weak self] key in
            guard let array = groupped[key] else { return }
            self?.data.append(array)
        }
        sortData()
        tableView?.reloadData()
    }

    func addPerson(_ person: Person) {
        guard let personBirthdate = person.birthdate else { return }
        for index in data.indices {
            guard let currentPersonBirthdate = data[index].first?.birthdate
            else { continue }
            let personMonth: Int = Calendar.current.component(.month, from: personBirthdate)
            let currentPersonMonth: Int = Calendar.current.component(.month, from: currentPersonBirthdate)
            if personMonth == currentPersonMonth {
                data[index].append(person)
                sortData()
                tableView?.reloadSections(IndexSet(index ... index), with: .automatic)
                return
            }
        }
        data.append([person])
        sortData()
        tableView?.reloadData()
    }

    private func sortData() {
        data = data.sorted { array1, array2 in
            guard let date1 = array1.first?.birthdate, let date2 = array2.first?.birthdate else { return false }
            let day1 = Calendar.current.component(.month, from: date1)
            let day2 = Calendar.current.component(.month, from: date2)
            return day1 < day2
        }
        for index in data.indices {
            data[index] = data[index].sorted { p1, p2 in
                guard let date1 = p1.birthdate, let date2 = p2.birthdate else { return false }
                let day1 = Calendar.current.component(.day, from: date1)
                let day2 = Calendar.current.component(.day, from: date2)
                return day1 < day2
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension PersonsDataSource: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return data.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableCell",
            for: indexPath
        ) as? PersonCell
        let item = data[indexPath.section][indexPath.row]
        cell?.configure(cell: item)
        return cell ?? UITableViewCell()
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 40
    }

    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let date = data[section].first?.birthdate else { return nil }
        let view = DateSectionHeader()
        view.configure(date: date)
        return view
    }
}

// MARK: - UITableViewDelegate

extension PersonsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
