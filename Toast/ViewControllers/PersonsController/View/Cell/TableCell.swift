//
//  PersonCell.swift
//  Birthdays
//
//  Created by Олег Романов on 05.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupStyle()
    }

    private func setupStyle() {
        accessoryType = .disclosureIndicator
    }

    func configure(cell: Person) {
        textLabel?.text = cell.name
        // subtitleLabel.text = cell.subtitle
    }
}
